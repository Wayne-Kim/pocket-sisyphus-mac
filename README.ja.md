<!--
Languages: 한국어 · English · 日本語 (default) · العربية · Español · Français · हिन्दी · Português (BR) · Русский · 简体中文
-->

# Pocket Sisyphus for Mac

[한국어](README.md) · [English](README.en.md) · **日本語** · [العربية](README.ar.md) · [Español](README.es.md) · [Français](README.fr.md) · [हिन्दी](README.hi.md) · [Português (BR)](README.pt-BR.md) · [Русский](README.ru.md) · [简体中文](README.zh-Hans.md)

> Mac 上で動いている Claude Code(Codex CLI、Gemini CLI 対応予定)を、スマホから安全に操作できる macOS アプリ。
> **Tor onion service** ベース・**外部サーバー 0**・**有料サービス 0**。

## 📥 ダウンロード

最新ビルドは [Releases ページ](../../releases/latest) から取得できます。

```
PocketSisyphusMac-v<バージョン>-build<番号>.dmg
```

DMG は Apple Developer ID で署名され、Apple の公証 (notarization) を通過しています。Gatekeeper の警告なくそのまま起動します。

## 🧰 動作環境

| 項目 | 必要条件 |
|---|---|
| macOS | 13.0 (Ventura) 以降 |
| CPU | Apple Silicon または Intel |
| ディスク | 約 400 MB(同梱の Node.js + Tor を含む) |
| ネットワーク | 通常のインターネット接続(ファイアウォール/ルーターの設定不要) |

## 🚀 インストール

1. `PocketSisyphusMac-v*.dmg` をダブルクリック。
2. **Pocket Sisyphus.app** を **アプリケーション** フォルダにドラッグ。
3. Launchpad または Spotlight から **Pocket Sisyphus** を起動。

> ⚠️ Gatekeeper が「開発元が未確認です」と警告する場合は、公証チケットがまだローカルにキャッシュされていません。アプリアイコンを **右クリック → 開く** で一度承認すれば、以降は自動的に起動します。

## 📱 初回起動 — スマホとペアリング

1. 初回起動時、daemon が自動的に Tor の onion service を作成します(`xxxxx.onion`)。
2. メニューバーアイコン → **Show Pairing QR**。
3. iOS の **Pocket Sisyphus** アプリ(TestFlight)で QR をスキャン。
4. これでスマホは LTE/5G/Wi-Fi のどこからでも Tor 経由で Mac に接続できます。

ペアリングが終わると、スマホからチャット、Approval、ファイル変更レビューが可能になります。

## 🛡️ セキュリティモデル

- **外部サーバー依存ゼロ** — メンテナーのインフラなし、Tor 分散ネットワークのみ。
- **NAT/CGNAT 不問** — 両端とも outbound で Tor に接続するため、ポート転送不要。
- **二重認証** — `.onion` アドレス(Ed25519 鍵) + Bearer トークン。
- **daemon は 127.0.0.1 のみバインド** — 直接アクセス不可、Tor onion のみが入口。

## 🧯 トラブルシューティング

**アプリが開かない / Gatekeeper 警告**
→ `アプリケーション` フォルダのアイコンを右クリック → 開く → 確認。

**メニューバーにアイコンが見えない**
→ Mission Control で他のデスクトップにあるかもしれません。`cmd+space` で "Pocket Sisyphus" を検索。

**Tor サーキットが構築できない**
→ 一部の企業/学校ネットワークは Tor をブロックしています。個人のホットスポットなど別の回線で試してください。

**ペアリングに失敗する**
→ スマホと Mac は同じ Wi-Fi である必要はありません。スマホ側の LTE/5G でも OK。ただしスマホの **Pocket Sisyphus.app** が Tor の起動を完了している必要があります(アプリ内に進行状況が表示されます)。

**さらに詳しく**
→ 各ビルドの [Release ノート](../../releases)。

## 📜 ライセンス

このリポジトリはビルド済み macOS バイナリの配布専用です。アプリは BSD/Apache/MIT 互換の OSS コンポーネント(Tor, arti, Node.js 等)のみを使用しています。

ソースコードは現在非公開です。

## 💬 フィードバック / バグ報告

[Issues](../../issues) で受け付けています。
