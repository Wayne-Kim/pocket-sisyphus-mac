<!--
Languages: 한국어 · English · 日本語 · العربية · Español · Français · हिन्दी · Português (BR) · Русский · 简体中文 (default)
-->

# Pocket Sisyphus for Mac

[한국어](README.md) · [English](README.en.md) · [日本語](README.ja.md) · [العربية](README.ar.md) · [Español](README.es.md) · [Français](README.fr.md) · [हिन्दी](README.hi.md) · [Português (BR)](README.pt-BR.md) · [Русский](README.ru.md) · **简体中文**

> 一款 macOS 应用,让你通过手机安全地控制运行在 Mac 上的 Claude Code(即将支持 Codex CLI、Gemini CLI)。
> 基于 **Tor onion 服务** · **零外部服务器** · **零付费服务** · **100% OSS 组件**。

## 📥 下载

从 [Releases 页面](../../releases/latest) 获取最新版本:

```
PocketSisyphusMac-v<版本>-build<编号>.dmg
```

DMG 已使用 Apple Developer ID 签名并通过 Apple 公证 (notarization) — Gatekeeper 不会出现警告,直接打开。

## 🧰 系统要求

| 项目 | 最低 |
|---|---|
| macOS | 13.0 (Ventura) 或更新 |
| CPU | Apple Silicon 或 Intel |
| 磁盘 | 约 400 MB(含内置的 Node.js + Tor) |
| 网络 | 任何互联网连接(无需配置防火墙/路由器) |

## 🚀 安装

1. 双击 `PocketSisyphusMac-v*.dmg`。
2. 将 **Pocket Sisyphus.app** 拖入 **应用程序** 文件夹。
3. 从 Launchpad 或 Spotlight 启动 **Pocket Sisyphus**。

> ⚠️ 如果 Gatekeeper 提示"未识别的开发者",说明公证票据还没在本地缓存。右键点击应用图标 → **打开**,确认一次后 macOS 会记住信任设置。

## 📱 首次启动 — 配对手机

1. 首次启动时,daemon 会自动创建一个 Tor onion 服务(`xxxxx.onion`)。
2. 菜单栏图标 → **Show Pairing QR**。
3. 用 iOS 上的 **Pocket Sisyphus** App(TestFlight)扫描 QR 码。
4. 现在手机可以通过 Tor 从任何 LTE/5G/Wi-Fi 网络访问 Mac。

配对完成后即可在手机上聊天、批准更改(Approval)、查看文件 diff。

## 🛡️ 安全模型

- **零外部服务器** — 没有维护者的基础设施,只用 Tor 分布式网络。
- **不受 NAT/CGNAT 影响** — 两端都是出站连接到 Tor,无需端口转发。
- **双重认证** — `.onion` 地址(Ed25519 密钥) + Bearer 令牌。
- **daemon 仅绑定 127.0.0.1** — 不可直接访问,唯一入口是 Tor onion。

## 🧯 故障排查

**应用打不开 / Gatekeeper 警告**
→ 右键点击 `应用程序` 中的图标 → 打开 → 确认。

**菜单栏没有图标**
→ Mission Control 可能把它放到了另一个桌面。按 `cmd+space` 搜索 "Pocket Sisyphus"。

**Tor 线路无法建立**
→ 部分企业/校园网络会屏蔽 Tor。请尝试个人热点。

**配对失败**
→ 手机和 Mac 不需要在同一 Wi-Fi。手机用 LTE/5G 也可以,但 iOS 上的 **Pocket Sisyphus.app** 必须完成 Tor 启动(应用内可见进度)。

**更多信息**
→ 查看各 [release](../../releases) 的发布说明。

## 📜 许可

本仓库仅托管预编译的 macOS 二进制文件。应用仅使用与 BSD/Apache/MIT 兼容的 OSS 组件(Tor、arti、Node.js 等)。

源代码目前未开源。

## 💬 反馈 / Bug

请提交 [Issue](../../issues)。
