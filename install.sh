#!/usr/bin/env bash
#
# Pocket Sisyphus for Mac — 한 줄 설치 스크립트.
#
# 사용자는 이거 한 줄만 실행하면 된다 (사전 의존성 0 — macOS 에 기본 탑재된 curl 만 필요):
#
#   curl -fsSL https://raw.githubusercontent.com/Wayne-Kim/pocket-sisyphus-mac/main/install.sh | bash
#
# 동작:
#   1) GitHub Release 의 «최신» appcast.xml (고정 URL) 에서 최신 DMG 다운로드 URL 을 파싱
#      — appcast.xml 의 <enclosure> 가 곧 «최신 DMG» 의 single source of truth.
#      (파싱 실패 시 GitHub API 로 fallback)
#   2) DMG 다운로드 → 마운트 → 안에 있는 .app 을 /Applications 로 복사 → 언마운트
#   3) 실행 중이던 기존 인스턴스가 있으면 종료한 뒤 교체
#   4) 설치된 앱 실행 (open)
#
# DMG 는 Apple notarize + staple 완료본이라 Gatekeeper 가 조용히 통과한다
# (curl 다운로드는 quarantine 플래그도 안 붙어 첫 실행 경고 없음).
#
# 환경변수 (선택):
#   PS_REPO          : 릴리스 저장소 (기본 Wayne-Kim/pocket-sisyphus-mac)
#   PS_INSTALL_DIR   : 설치 위치 (기본 /Applications)
#   PS_NO_LAUNCH=1   : 설치 후 자동 실행 생략

set -euo pipefail

REPO="${PS_REPO:-Wayne-Kim/pocket-sisyphus-mac}"
INSTALL_DIR="${PS_INSTALL_DIR:-/Applications}"

red()    { printf "\033[31m%s\033[0m\n" "$*" >&2; }
green()  { printf "\033[32m%s\033[0m\n" "$*"; }
yellow() { printf "\033[33m%s\033[0m\n" "$*"; }
step()   { printf "\n\033[1;36m▸ %s\033[0m\n" "$*"; }

# ----------------------------------------------------------------------------
# 0) 환경 점검
# ----------------------------------------------------------------------------

[ "$(uname -s)" = "Darwin" ] || { red "macOS 전용 설치 스크립트입니다."; exit 1; }
command -v curl   >/dev/null || { red "curl 이 필요합니다."; exit 1; }
command -v hdiutil>/dev/null || { red "hdiutil 이 필요합니다 (macOS 기본 제공)."; exit 1; }

printf "\033[1;35m"
cat <<'BANNER'
  ____           _        _     ____  _                       _
 |  _ \ ___   ___| | _____| |_  / ___|(_)___ _   _ _ __  _ __ | |_   _ ___
 | |_) / _ \ / __| |/ / _ \ __| \___ \| / __| | | | '_ \| '_ \| | | | / __|
 |  __/ (_) | (__|   <  __/ |_   ___) | \__ \ |_| | |_) | | | | | |_| \__ \
 |_|   \___/ \___|_|\_\___|\__| |____/|_|___/\__, | .__/|_| |_|_|\__,_|___/
                                             |___/|_|
BANNER
printf "\033[0m"
green "Pocket Sisyphus for Mac — 설치를 시작합니다."

# 임시 작업공간 + 정리 트랩.
WORK_DIR="$(mktemp -d "${TMPDIR:-/tmp}/pocket-sisyphus.XXXXXX")"
DMG_PATH="$WORK_DIR/PocketSisyphus.dmg"
MOUNT_POINT="$WORK_DIR/mnt"
mkdir -p "$MOUNT_POINT"

cleanup() {
    if [ -d "${MOUNT_POINT:-}" ] && mount | grep -q " ${MOUNT_POINT} "; then
        hdiutil detach "$MOUNT_POINT" -quiet 2>/dev/null || true
    fi
    [ -n "${WORK_DIR:-}" ] && rm -rf "$WORK_DIR" 2>/dev/null || true
}
trap cleanup EXIT

# ----------------------------------------------------------------------------
# 1) 최신 DMG URL 해석
# ----------------------------------------------------------------------------

step "최신 버전 확인"

# 1차: 고정 URL 의 appcast.xml (<enclosure> = 최신 DMG 직링크).
APPCAST_URL="https://github.com/${REPO}/releases/latest/download/appcast.xml"
APPCAST="$(curl -fsSL "$APPCAST_URL" 2>/dev/null || true)"

DMG_URL="$(printf '%s' "$APPCAST" \
    | grep -o 'enclosure url="[^"]*\.dmg"' \
    | head -1 \
    | sed -E 's/.*url="([^"]*)".*/\1/' || true)"
VERSION="$(printf '%s' "$APPCAST" \
    | grep -o '<title>v[^<]*</title>' \
    | head -1 \
    | sed -E 's@</?title>@@g' || true)"

# 2차 (fallback): GitHub API 로 최신 release 의 .dmg asset 직접 조회.
if [ -z "$DMG_URL" ]; then
    yellow "appcast.xml 파싱 실패 — GitHub API 로 fallback."
    DMG_URL="$(curl -fsSL "https://api.github.com/repos/${REPO}/releases/latest" 2>/dev/null \
        | grep -o '"browser_download_url"[^,]*\.dmg"' \
        | head -1 \
        | sed -E 's/.*"(https[^"]*)".*/\1/' || true)"
fi

if [ -z "$DMG_URL" ]; then
    red "최신 DMG 다운로드 URL 을 찾지 못했습니다."
    red "  저장소: https://github.com/${REPO}/releases/latest 를 직접 확인해 주세요."
    exit 1
fi
green "  ${VERSION:-최신} → $(basename "$DMG_URL")"

# ----------------------------------------------------------------------------
# 2) 다운로드
# ----------------------------------------------------------------------------

step "다운로드"
curl -fL --progress-bar -o "$DMG_PATH" "$DMG_URL"

# ----------------------------------------------------------------------------
# 3) 마운트 → .app 추출
# ----------------------------------------------------------------------------

step "DMG 마운트"
hdiutil attach -nobrowse -readonly -mountpoint "$MOUNT_POINT" "$DMG_PATH" >/dev/null

APP_SRC="$(find "$MOUNT_POINT" -maxdepth 1 -name '*.app' -type d | head -1)"
if [ -z "$APP_SRC" ]; then
    red "DMG 안에서 .app 을 찾지 못했습니다."
    exit 1
fi
APP_NAME="$(basename "$APP_SRC")"
DEST="$INSTALL_DIR/$APP_NAME"

# ----------------------------------------------------------------------------
# 4) 실행 중 인스턴스 종료 → 설치
# ----------------------------------------------------------------------------

# 실행 중이면 먼저 점잖게 종료 (열린 채 번들을 덮어쓰면 손상 가능).
osascript -e "quit app \"${APP_NAME%.app}\"" >/dev/null 2>&1 || true

step "${INSTALL_DIR} 에 설치"
# /Applications 는 보통 admin 그룹 쓰기 가능. 권한 없으면 sudo 로 한 번만 승격
# (sudo 는 /dev/tty 에서 비밀번호를 받으므로 curl|bash 파이프에서도 동작).
if [ -w "$INSTALL_DIR" ] && { [ ! -e "$DEST" ] || [ -w "$DEST" ]; }; then
    rm -rf "$DEST"
    ditto "$APP_SRC" "$DEST"
else
    yellow "  ${INSTALL_DIR} 쓰기 권한이 없어 관리자 비밀번호가 필요합니다."
    sudo rm -rf "$DEST"
    sudo ditto "$APP_SRC" "$DEST"
    sudo chown -R "$(id -un):$(id -gn)" "$DEST" 2>/dev/null || true
fi

# curl 다운로드면 quarantine 가 없지만, 혹시 모를 경로(브라우저 경유 등) 대비해 제거.
xattr -dr com.apple.quarantine "$DEST" 2>/dev/null \
    || sudo xattr -dr com.apple.quarantine "$DEST" 2>/dev/null || true

# Gatekeeper 평가 (soft check — 실패해도 설치는 진행).
if spctl --assess --type execute "$DEST" >/dev/null 2>&1; then
    green "  Gatekeeper 통과 확인 (notarized)."
else
    yellow "  Gatekeeper 평가를 생략했습니다 — 첫 실행 시 우클릭→열기 가 필요할 수 있습니다."
fi

# ----------------------------------------------------------------------------
# 5) 실행
# ----------------------------------------------------------------------------

green ""
green "✔ 설치 완료: $DEST"
if [ "${PS_NO_LAUNCH:-0}" != "1" ]; then
    step "실행"
    open "$DEST"
    green "  메뉴바에서 Pocket Sisyphus 아이콘을 확인하세요."
else
    green "  Launchpad / Spotlight 에서 «Pocket Sisyphus» 로 실행하세요."
fi
green ""
green "  이후 업데이트는 앱 내장 Sparkle 이 자동 감지합니다 (메뉴바 → «업데이트 확인…»)."
