<!--
Languages: 한국어 · English · 日本語 · العربية · Español · Français (default) · हिन्दी · Português (BR) · Русский · 简体中文
-->

# Pocket Sisyphus pour Mac

[한국어](README.md) · [English](README.en.md) · [日本語](README.ja.md) · [العربية](README.ar.md) · [Español](README.es.md) · **Français** · [हिन्दी](README.hi.md) · [Português (BR)](README.pt-BR.md) · [Русский](README.ru.md) · [简体中文](README.zh-Hans.md)

> Une app macOS qui permet de contrôler en toute sécurité plusieurs CLI d’agents de codage (Claude Code, Google Antigravity, etc.) tournant sur votre Mac depuis votre téléphone.
> Propulsée par les **services onion Tor** · **zéro serveur**.

## 📥 Téléchargement

Récupérez la dernière version depuis la [page Releases](../../releases/latest) :

```
PocketSisyphusMac-v<version>-build<numéro>.dmg
```

Le DMG est signé avec un Apple Developer ID et notarisé par Apple — Gatekeeper l'ouvre sans avertissement.

## 🧰 Configuration requise

| Élément | Minimum |
|---|---|
| macOS | 13.0 (Ventura) ou supérieur |
| CPU | Apple Silicon ou Intel |
| Disque | ~400 Mo (Node.js + Tor inclus) |
| Réseau | Toute connexion Internet (pas de configuration firewall/routeur) |

## ⚡️ Installation en une ligne (recommandé)

Collez ceci dans le Terminal : la dernière version s'installe dans `/Applications` et se lance automatiquement — zéro prérequis (juste le `curl` fourni avec macOS) :

```bash
curl -fsSL https://raw.githubusercontent.com/Wayne-Kim/pocket-sisyphus-mac/main/install.sh | bash
```

Le script lit le lien direct du DMG depuis l'`appcast.xml` de la dernière release, puis télécharge → monte → copie `.app` dans `/Applications` → le lance. Le DMG est notarisé + stapled, donc Gatekeeper reste silencieux. Méfiant envers `curl | bash` ? Lisez d'abord [install.sh](install.sh).

## 🚀 Installation manuelle

1. Double-cliquez sur `PocketSisyphusMac-v*.dmg`.
2. Glissez **Pocket Sisyphus.app** dans le dossier **Applications**.
3. Lancez **Pocket Sisyphus** depuis Launchpad ou Spotlight.

> ⚠️ Si Gatekeeper affiche « développeur non identifié », le ticket de notarisation n'est pas encore en cache local. Clic droit sur l'icône → **Ouvrir** une fois ; macOS s'en souviendra ensuite.

## 📱 Premier lancement — Appairer le téléphone

1. (Mac) Au premier lancement, le daemon crée automatiquement un service onion Tor (`xxxxx.onion`).
2. (Mac) Icône de la barre de menu → **Show Pairing QR**.
3. (Téléphone) Au premier lancement, l'app iOS **Pocket Sisyphus** vous demande de choisir un **mode de connexion** — « Partout (Tor) » ou « Même Wi-Fi uniquement ».
4. (Téléphone) Scannez le QR pour appairer.
   - **Partout** — le téléphone se connecte au Mac via le réseau Tor depuis n'importe où (LTE/5G/Wi-Fi).
   - **Même Wi-Fi uniquement** — connexion directe via une adresse privée seulement lorsque le téléphone et le Mac sont sur le même Wi-Fi (plus rapide), et blocage de la connexion sur les réseaux extérieurs.

Une fois appairé, vous pouvez chatter, approuver des modifications (Approval), et examiner des diffs de fichiers depuis le téléphone.

## 🛡️ Modèle de sécurité

- **Aucun serveur externe** — pas d'infrastructure du mainteneur, uniquement le réseau Tor.
- **Insensible au NAT/CGNAT** — les deux extrémités se connectent en sortant (outbound) vers Tor, pas de port-forwarding.
- **Double authentification** — adresse `.onion` (clé Ed25519) + jeton Bearer.
- **Le daemon écoute uniquement sur 127.0.0.1** — inaccessible directement, le service onion Tor est le seul point d'entrée.
- **Mode même Wi-Fi uniquement (facultatif)** — une fois activé, il ne se connecte que via une adresse privée sur le même Wi-Fi et bloque Tor, les IP publiques et tout trafic sortant extérieur (fail-closed). À utiliser quand vous avez besoin de garantir qu'aucun paquet ne quitte votre réseau local.

## 🧯 Dépannage

**L'app ne s'ouvre pas / avertissement Gatekeeper**
→ Clic droit sur l'icône dans `Applications` → Ouvrir → confirmer.

**Aucune icône dans la barre de menu**
→ Mission Control peut l'avoir placée sur un autre bureau. `cmd+espace` → rechercher "Pocket Sisyphus".

**Le circuit Tor ne se construit pas**
→ Certains réseaux d'entreprise/d'école bloquent Tor. Essayez via un hotspot personnel.

**L'appairage échoue**
→ En mode « Partout (Tor) », le téléphone et le Mac n'ont pas besoin d'être sur le même Wi-Fi (LTE/5G fonctionne), tant que l'app iOS **Pocket Sisyphus.app** a terminé son démarrage Tor (progression affichée dans l'app). En mode « Même Wi-Fi uniquement », le téléphone et le Mac DOIVENT être sur le même Wi-Fi.

**Plus d'infos**
→ Notes de chaque [release](../../releases).

## 📜 Licence

Ce dépôt héberge uniquement des binaires macOS précompilés. L'app utilise exclusivement des composants OSS compatibles BSD/Apache/MIT (Tor, arti, Node.js, etc.).

Le code source est actuellement fermé.

## 💬 Retours / Bugs

Ouvrez une [issue](../../issues).
