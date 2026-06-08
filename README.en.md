<!--
Languages: 한국어 · English (default) · 日本語 · العربية · Español · Français · हिन्दी · Português (BR) · Русский · 简体中文
-->

# Pocket Sisyphus for Mac

[한국어](README.md) · **English** · [日本語](README.ja.md) · [العربية](README.ar.md) · [Español](README.es.md) · [Français](README.fr.md) · [हिन्दी](README.hi.md) · [Português (BR)](README.pt-BR.md) · [Русский](README.ru.md) · [简体中文](README.zh-Hans.md)

> A macOS app that lets you safely control multiple coding-agent CLIs (Claude Code, Google Antigravity, and more) running on your Mac from your phone.
> Powered by **Tor onion services** · **zero servers**.

## 📥 Download

Grab the latest build from the [Releases page](../../releases/latest):

```
PocketSisyphusMac-v<version>-build<number>.dmg
```

The DMG is signed with an Apple Developer ID and notarized by Apple — Gatekeeper opens it without warnings.

## 🧰 System Requirements

| Item | Minimum |
|---|---|
| macOS | 13.0 (Ventura) or later |
| CPU | Apple Silicon or Intel |
| Disk | ~400 MB (bundled Node.js + Tor included) |
| Network | Any internet connection (no firewall/router setup) |

## ⚡️ One-line install (recommended)

Paste this into Terminal and the latest version installs to `/Applications` and launches automatically — zero prerequisites (just the `curl` that ships with macOS):

```bash
curl -fsSL https://raw.githubusercontent.com/Wayne-Kim/pocket-sisyphus-mac/main/install.sh | bash
```

The script reads the direct DMG link from the latest release's `appcast.xml`, then downloads → mounts → copies `.app` into `/Applications` → launches it. The DMG is notarized + stapled, so Gatekeeper stays silent. Wary of `curl | bash`? Read [install.sh](install.sh) first.

## 🚀 Manual install

1. Double-click `PocketSisyphusMac-v*.dmg`.
2. Drag **Pocket Sisyphus.app** into your **Applications** folder.
3. Launch **Pocket Sisyphus** from Launchpad or Spotlight.

> ⚠️ If Gatekeeper says "unidentified developer", the notarization ticket hasn't been cached locally. Right-click the app icon → **Open** once; macOS will trust it from then on.

## 📱 First Launch — Pair Your Phone

1. On first launch, the daemon spins up a Tor onion service automatically (`xxxxx.onion`).
2. Menu bar icon → **Show Pairing QR**.
3. Scan the QR in the iOS **Pocket Sisyphus** app (TestFlight).
4. Your phone can now reach the Mac over Tor from any LTE/5G/Wi-Fi network.

Once paired, you can chat, approve diffs, and review file changes from your phone.

## 🛡️ Security Model

- **Zero external servers** — no maintainer infrastructure, only the Tor network.
- **NAT/CGNAT-proof** — both ends connect outbound to Tor; no port forwarding needed.
- **Double auth** — `.onion` address (Ed25519 key) + bearer token.
- **Daemon binds 127.0.0.1 only** — not reachable directly; only the Tor onion is the entry point.

## 🧯 Troubleshooting

**App won't open / Gatekeeper warning**
→ Right-click the app in `Applications` → Open → confirm.

**No menu bar icon**
→ Mission Control may have it on another desktop. `cmd+space` → search "Pocket Sisyphus".

**Tor circuit won't build**
→ Some corporate/campus networks block Tor. Try a personal hotspot.

**Pairing fails**
→ Your phone and Mac don't need to be on the same Wi-Fi. LTE/5G on the phone is fine. But the iOS **Pocket Sisyphus.app** must have finished its Tor bootstrap (progress shown in-app).

**More info**
→ Build notes on each [release](../../releases).

## 📜 License

This repository hosts prebuilt macOS binaries only. The app uses BSD/Apache/MIT-compatible OSS components exclusively (Tor, arti, Node.js, etc.).

The source code is currently closed-source.

## 💬 Feedback / Bugs

Open an [issue](../../issues).
