<!--
Languages: 한국어 · English · 日本語 · العربية · Español · Français · हिन्दी · Português (BR) (default) · Русский · 简体中文
-->

# Pocket Sisyphus para Mac

[한국어](README.md) · [English](README.en.md) · [日本語](README.ja.md) · [العربية](README.ar.md) · [Español](README.es.md) · [Français](README.fr.md) · [हिन्दी](README.hi.md) · **Português (BR)** · [Русский](README.ru.md) · [简体中文](README.zh-Hans.md)

> Um app para macOS que permite controlar com segurança o Claude Code (Codex CLI e Gemini CLI em breve) rodando no seu Mac a partir do seu celular.
> Movido por **serviços onion do Tor** · **zero servidores externos** · **zero serviços pagos** · **componentes 100% OSS**.

## 📥 Download

Pegue a versão mais recente na [página de Releases](../../releases/latest):

```
PocketSisyphusMac-v<versão>-build<número>.dmg
```

O DMG é assinado com um Apple Developer ID e notarizado pela Apple — o Gatekeeper abre sem avisos.

## 🧰 Requisitos de sistema

| Item | Mínimo |
|---|---|
| macOS | 13.0 (Ventura) ou superior |
| CPU | Apple Silicon ou Intel |
| Disco | ~400 MB (Node.js + Tor inclusos) |
| Rede | Qualquer conexão de internet (sem configuração de firewall/roteador) |

## 🚀 Instalação

1. Dê duplo clique em `PocketSisyphusMac-v*.dmg`.
2. Arraste **Pocket Sisyphus.app** para a pasta **Aplicativos**.
3. Abra **Pocket Sisyphus** pelo Launchpad ou Spotlight.

> ⚠️ Se o Gatekeeper mostrar "desenvolvedor não identificado", o ticket de notarização ainda não foi cacheado localmente. Clique com o botão direito no ícone → **Abrir** uma vez; o macOS confiará a partir daí.

## 📱 Primeira execução — Parear o celular

1. Na primeira execução, o daemon cria automaticamente um serviço onion do Tor (`xxxxx.onion`).
2. Ícone na barra de menu → **Show Pairing QR**.
3. Escaneie o QR pelo app iOS **Pocket Sisyphus** (TestFlight).
4. Seu celular já consegue alcançar o Mac via Tor a partir de qualquer rede LTE/5G/Wi-Fi.

Após o pareamento, você pode conversar, aprovar mudanças (Approval) e revisar diffs de arquivos pelo celular.

## 🛡️ Modelo de segurança

- **Zero servidores externos** — sem infraestrutura do mantenedor, apenas a rede Tor.
- **Imune a NAT/CGNAT** — ambos os lados conectam de saída (outbound) ao Tor, sem port-forwarding.
- **Autenticação dupla** — endereço `.onion` (chave Ed25519) + token Bearer.
- **O daemon escuta apenas em 127.0.0.1** — sem acesso direto, somente o onion do Tor é o ponto de entrada.

## 🧯 Solução de problemas

**O app não abre / aviso do Gatekeeper**
→ Clique direito no ícone em `Aplicativos` → Abrir → confirmar.

**Sem ícone na barra de menu**
→ Mission Control pode estar com ele em outra área de trabalho. `cmd+espaço` → buscar "Pocket Sisyphus".

**Circuito do Tor não se constrói**
→ Algumas redes corporativas/escolares bloqueiam Tor. Tente por um hotspot pessoal.

**Pareamento falha**
→ Celular e Mac não precisam estar no mesmo Wi-Fi. LTE/5G do celular serve. Mas o app iOS **Pocket Sisyphus.app** precisa ter terminado o bootstrap do Tor (progresso visível no app).

**Mais informações**
→ Notas de cada [release](../../releases).

## 📜 Licença

Este repositório hospeda apenas binários macOS pré-compilados. O app usa exclusivamente componentes OSS compatíveis com BSD/Apache/MIT (Tor, arti, Node.js, etc.).

O código-fonte é fechado no momento.

## 💬 Feedback / Bugs

Abra um [issue](../../issues).
