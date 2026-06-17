<!--
Languages: 한국어 · English · 日本語 · العربية · Español · Français · हिन्दी · Português (BR) (default) · Русский · 简体中文
-->

# Pocket Sisyphus para Mac

[한국어](README.md) · [English](README.en.md) · [日本語](README.ja.md) · [العربية](README.ar.md) · [Español](README.es.md) · [Français](README.fr.md) · [हिन्दी](README.hi.md) · **Português (BR)** · [Русский](README.ru.md) · [简体中文](README.zh-Hans.md)

> Um app para macOS que permite controlar com segurança várias CLIs de agentes de programação (Claude Code, Google Antigravity e mais) rodando no seu Mac a partir do seu celular.
> Movido por **serviços onion do Tor** · **zero servidores externos**.

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

## ⚡️ Instalação em uma linha (recomendado)

Cole isto no Terminal e a versão mais recente é instalada em `/Applications` e iniciada automaticamente — zero pré-requisitos (apenas o `curl` que já vem no macOS):

```bash
curl -fsSL https://raw.githubusercontent.com/Wayne-Kim/pocket-sisyphus-mac/main/install.sh | bash
```

O script lê o link direto do DMG no `appcast.xml` da release mais recente, então baixa → monta → copia `.app` para `/Applications` → inicia. O DMG é notarizado + stapled, então o Gatekeeper não avisa. Receoso com `curl | bash`? Leia o [install.sh](install.sh) antes.

## 🚀 Instalação manual

1. Dê duplo clique em `PocketSisyphusMac-v*.dmg`.
2. Arraste **Pocket Sisyphus.app** para a pasta **Aplicativos**.
3. Abra **Pocket Sisyphus** pelo Launchpad ou Spotlight.

> ⚠️ Se o Gatekeeper mostrar "desenvolvedor não identificado", o ticket de notarização ainda não foi cacheado localmente. Clique com o botão direito no ícone → **Abrir** uma vez; o macOS confiará a partir daí.

## 📱 Primeira execução — Parear o celular

1. (Mac) Na primeira execução, o daemon cria automaticamente um serviço onion do Tor (`xxxxx.onion`).
2. (Mac) Ícone na barra de menu → **Show Pairing QR**.
3. (Celular) Na primeira execução, o app iOS **Pocket Sisyphus** pede para você escolher um **modo de conexão** — “De qualquer lugar (Tor)” ou “Somente a mesma Wi-Fi”.
4. (Celular) Escaneie o QR para parear.
   - **De qualquer lugar** — o celular se conecta ao Mac pela rede Tor de qualquer lugar (LTE/5G/Wi-Fi).
   - **Somente a mesma Wi-Fi** — conecta diretamente por um endereço privado apenas quando o celular e o Mac estão na mesma Wi-Fi (mais rápido), e bloqueia a conexão em redes externas.

Após o pareamento, você pode conversar, aprovar mudanças (Approval) e revisar diffs de arquivos pelo celular.

## 🛡️ Modelo de segurança

- **Zero servidores externos** — sem infraestrutura do mantenedor, apenas a rede Tor.
- **Imune a NAT/CGNAT** — ambos os lados conectam de saída (outbound) ao Tor, sem port-forwarding.
- **Autenticação dupla** — endereço `.onion` (chave Ed25519) + token Bearer.
- **O daemon escuta apenas em 127.0.0.1** — sem acesso direto, somente o onion do Tor é o ponto de entrada.
- **Modo somente a mesma Wi-Fi (opcional)** — quando ativado, conecta apenas por um endereço privado na mesma Wi-Fi e bloqueia Tor, IP público e todo tráfego outbound externo (fail-closed). Para quando você precisa garantir que nenhum pacote saia da sua rede local.

## 🧯 Solução de problemas

**O app não abre / aviso do Gatekeeper**
→ Clique direito no ícone em `Aplicativos` → Abrir → confirmar.

**Sem ícone na barra de menu**
→ Mission Control pode estar com ele em outra área de trabalho. `cmd+espaço` → buscar "Pocket Sisyphus".

**Circuito do Tor não se constrói**
→ Algumas redes corporativas/escolares bloqueiam Tor. Tente por um hotspot pessoal.

**Pareamento falha**
→ No modo “De qualquer lugar (Tor)”, celular e Mac não precisam estar na mesma Wi-Fi (LTE/5G serve), desde que o app iOS **Pocket Sisyphus.app** tenha terminado o bootstrap do Tor (progresso visível no app). No modo “Somente a mesma Wi-Fi”, celular e Mac DEVEM estar na mesma Wi-Fi.

**Mais informações**
→ Notas de cada [release](../../releases).

## 📜 Licença

Este repositório hospeda apenas binários macOS pré-compilados. O app usa exclusivamente componentes OSS compatíveis com BSD/Apache/MIT (Tor, arti, Node.js, etc.).

O código-fonte é fechado no momento.

## 💬 Feedback / Bugs

Abra um [issue](../../issues).
