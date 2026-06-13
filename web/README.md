# web — Pocket Sisyphus 소개 사이트

Pocket Sisyphus 의 **정적 소개 페이지(랜딩)**. Next.js 정적 추출(`output: "export"`)로 만들어
**GitHub Pages** 에 빌드 배포한다 — 동적 백엔드·DB·로그인·커뮤니티 같은 기능은 **없다**.
그냥 마케팅 한 장짜리 페이지다.

> 커뮤니티는 웹에서 만들지 않고 **GitHub Discussions** 외부 링크로 보낸다(iOS 설정의
> 「커뮤니티」와 동일 목적지 — 인프라·비용 0). 「외부 인프라 0」 원칙은 사용자가 직접 돌리는
> 두 앱(iOS · Mac)의 성질이고, 이 소개 사이트는 그 적용 대상이 아니다.
> 자세한 경계는 저장소 루트 [README](../README.md#프로젝트-경계) 참고.

## 구조

- `app/` — Next.js App Router. `page.tsx` 가 섹션 컴포넌트를 조립하는 단일 랜딩.
- `components/` — 한 섹션 = 한 파일 (Hero · Principles · Architecture · Agents · Features · Install · Cost · Footer).
- `content/` — 카피 SSOT (`site.en.ts`). 레이아웃과 분리 — i18n 시 `site.<locale>.ts` 추가.
- `lib/tokens.ts` — 디자인 토큰.

## 개발

```bash
pnpm install
pnpm dev        # http://localhost:3000
pnpm gen:og     # public/og.png(1200×630 공유 카드) 재생성 — 카피/브랜드 바뀔 때만
```

또는 저장소 루트에서 `/dev-web` 스킬.

## 배포

공개 OSS repo **`Wayne-Kim/pocket-sisyphus-mac`** 의 GitHub Pages 로 배포한다(이 repo 는
private 이라 Pages 가 안 됨). `.github/workflows/deploy-web.yml` 이 `web/**` push 시
정적 추출 → Pages 업로드한다. 프로젝트 페이지라 `/<repo>` 하위경로로 서빙되며 basePath·origin 은
`actions/configure-pages` 가 자동 주입(`NEXT_PUBLIC_BASE_PATH` · `NEXT_PUBLIC_SITE_URL`).
커스텀 도메인으로 옮기면 도메인만 붙이면 basePath 가 자동으로 비워진다. 정적 페이지라 시크릿 0.

> 최초 1회: repo Settings → Pages → Build and deployment → Source = **GitHub Actions**.
