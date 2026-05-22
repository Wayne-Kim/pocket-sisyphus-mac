<!--
Languages: 한국어 (default) · English · 日本語 · العربية · Español · Français · हिन्दी · Português (BR) · Русский · 简体中文
-->

# Pocket Sisyphus for Mac

**한국어** · [English](README.en.md) · [日本語](README.ja.md) · [العربية](README.ar.md) · [Español](README.es.md) · [Français](README.fr.md) · [हिन्दी](README.hi.md) · [Português (BR)](README.pt-BR.md) · [Русский](README.ru.md) · [简体中文](README.zh-Hans.md)

> 맥에서 돌아가는 Claude Code (준비 중 Codex CLI, Gemini CLI)를 폰에서 안전하게 제어하는 macOS 앱.
> **Tor onion service** 기반 · **외부 서버 0** · **유료 서비스 0**.

## 📥 다운로드

최신 빌드는 [Releases 페이지](../../releases/latest)에서 받을 수 있습니다.

```
PocketSisyphusMac-v<버전>-build<번호>.dmg
```

DMG는 Apple Developer ID로 서명되어 있고 Apple notarization을 통과했습니다. Gatekeeper 경고 없이 그대로 실행됩니다.

## 🧰 시스템 요구사항

| 항목 | 최소 |
|---|---|
| macOS | 13.0 (Ventura) 이상 |
| CPU | Apple Silicon 또는 Intel |
| 디스크 | 약 400 MB (임베드된 Node.js + Tor 포함) |
| 네트워크 | 일반 인터넷 연결 (방화벽/공유기 설정 불필요) |

## 🚀 설치

1. `PocketSisyphusMac-v*.dmg` 더블클릭.
2. 열린 창에서 `Pocket Sisyphus.app`을 **Applications** 폴더로 드래그.
3. Launchpad 또는 Spotlight에서 **Pocket Sisyphus** 실행.

> ⚠️ Gatekeeper가 "확인되지 않은 개발자" 경고를 띄우면 notarization이 캐시에 들어가지 않은 것입니다. 앱 아이콘을 **오른쪽 클릭 → 열기**를 한 번만 누르면 이후엔 자동으로 실행됩니다.

## 📱 첫 실행 — 폰과 페어링

1. 첫 실행 시 daemon이 Tor onion service를 자동으로 만듭니다 (`xxxxx.onion`).
2. 메뉴바 아이콘 → **Show Pairing QR**.
3. iOS의 **Pocket Sisyphus** 앱(TestFlight)에서 QR을 스캔.
4. 폰이 LTE/5G/와이파이 어디서든 Tor 네트워크를 통해 맥에 연결됩니다.

페어링이 끝나면 폰에서 채팅, Approval, 파일 변경 검토를 할 수 있습니다.

## 🛡️ 보안 모델

- **외부 서버 의존 0** — 메인테이너 인프라 없음. Tor 분산 네트워크만 사용.
- **NAT/CGNAT 무관** — 양쪽 모두 outbound로 Tor에 접속, 공유기 포워딩 불필요.
- **2중 인증** — `.onion` 주소(Ed25519 키) + Bearer 토큰.
- **daemon은 127.0.0.1 only** — 외부에서 직접 접근 불가, Tor onion만 진입로.

## 🧯 트러블슈팅

**앱이 안 열려요 / Gatekeeper 경고**
→ `Applications` 폴더에서 앱 아이콘 우클릭 → 열기 → "열기" 확인.

**메뉴바에 아이콘이 안 보여요**
→ Mission Control로 다른 데스크탑에 가 있을 수 있습니다. `cmd+space` → "Pocket Sisyphus" 검색.

**Tor 회로가 안 만들어져요**
→ 일부 회사/학교 네트워크는 Tor를 차단합니다. 다른 네트워크(개인 핫스팟 등)에서 시도하세요.

**페어링이 안 돼요**
→ 폰과 맥이 같은 Wi-Fi일 필요는 없습니다. 폰의 LTE/5G도 OK. 다만 폰의 **Pocket Sisyphus.app**이 Tor 부팅을 끝낸 상태여야 합니다 (앱 안에 진행률 표시).

**더 많은 정보**
→ [Releases 페이지](../../releases)의 각 빌드 노트.

## 📜 라이선스

이 배포 리포는 사전 빌드된 macOS 앱 바이너리 배포 전용입니다. 앱은 BSD/Apache/MIT 호환 OSS 컴포넌트만 사용합니다 (Tor, arti, Node.js 등).

소스 코드는 현재 비공개입니다.

## 💬 피드백 / 버그

[Issues](../../issues)에서 받습니다.
