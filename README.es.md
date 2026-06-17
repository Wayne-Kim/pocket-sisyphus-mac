<!--
Languages: 한국어 · English · 日本語 · العربية · Español (default) · Français · हिन्दी · Português (BR) · Русский · 简体中文
-->

# Pocket Sisyphus para Mac

[한국어](README.md) · [English](README.en.md) · [日本語](README.ja.md) · [العربية](README.ar.md) · **Español** · [Français](README.fr.md) · [हिन्दी](README.hi.md) · [Português (BR)](README.pt-BR.md) · [Русский](README.ru.md) · [简体中文](README.zh-Hans.md)

> Una app para macOS que te permite controlar de forma segura varias CLI de agentes de programación (Claude Code, Google Antigravity y más) corriendo en tu Mac desde tu teléfono.
> Basada en **servicios onion de Tor** · **cero servidores**.

## 📥 Descarga

Obtén la última versión desde la [página de Releases](../../releases/latest):

```
PocketSisyphusMac-v<versión>-build<número>.dmg
```

El DMG está firmado con un Apple Developer ID y notarizado por Apple — Gatekeeper lo abre sin advertencias.

## 🧰 Requisitos del sistema

| Elemento | Mínimo |
|---|---|
| macOS | 13.0 (Ventura) o superior |
| CPU | Apple Silicon o Intel |
| Disco | ~400 MB (incluye Node.js + Tor) |
| Red | Cualquier conexión a Internet (sin configurar firewall/router) |

## ⚡️ Instalación en una línea (recomendado)

Pega esto en la Terminal y la última versión se instala en `/Applications` y se inicia automáticamente — cero requisitos previos (solo el `curl` que trae macOS):

```bash
curl -fsSL https://raw.githubusercontent.com/Wayne-Kim/pocket-sisyphus-mac/main/install.sh | bash
```

El script lee el enlace directo al DMG desde el `appcast.xml` de la última release, luego descarga → monta → copia `.app` en `/Applications` → lo inicia. El DMG está notarizado + stapled, así que Gatekeeper no avisa. ¿Desconfías de `curl | bash`? Lee primero [install.sh](install.sh).

## 🚀 Instalación manual

1. Haz doble clic en `PocketSisyphusMac-v*.dmg`.
2. Arrastra **Pocket Sisyphus.app** a la carpeta **Aplicaciones**.
3. Inicia **Pocket Sisyphus** desde Launchpad o Spotlight.

> ⚠️ Si Gatekeeper muestra "desarrollador no identificado", el ticket de notarización aún no se ha cacheado localmente. Haz clic derecho sobre el icono → **Abrir** una vez; macOS lo recordará a partir de entonces.

## 📱 Primer arranque — Emparejar el teléfono

1. (Mac) En el primer arranque, el daemon crea automáticamente un servicio onion de Tor (`xxxxx.onion`).
2. (Mac) Icono de la barra de menú → **Show Pairing QR**.
3. (Teléfono) En el primer arranque, la app iOS **Pocket Sisyphus** te pide elegir un **modo de conexión** — «Desde cualquier lugar (Tor)» o «Solo la misma Wi-Fi».
4. (Teléfono) Escanea el QR para emparejar.
   - **Desde cualquier lugar** — el teléfono se conecta al Mac a través de la red Tor desde cualquier lugar (LTE/5G/Wi-Fi).
   - **Solo la misma Wi-Fi** — se conecta directamente mediante una dirección privada solo cuando el teléfono y el Mac están en la misma Wi-Fi (más rápido), y bloquea la conexión en redes externas.

Una vez emparejados, puedes chatear, aprobar cambios (Approval) y revisar diffs de archivos desde el teléfono.

## 🛡️ Modelo de seguridad

- **Cero servidores externos** — sin infraestructura del mantenedor, solo la red Tor.
- **Funciona detrás de NAT/CGNAT** — ambos extremos conectan salientes (outbound) a Tor, sin port-forwarding.
- **Doble autenticación** — dirección `.onion` (clave Ed25519) + token Bearer.
- **El daemon escucha solo en 127.0.0.1** — no es accesible directamente, solo a través del onion de Tor.
- **Modo solo la misma Wi-Fi (opcional)** — al activarlo, se conecta únicamente mediante una dirección privada en la misma Wi-Fi y bloquea Tor, IP públicas y todo tráfico saliente externo (fail-closed). Para cuando necesitas garantizar que ningún paquete salga de tu red local.

## 🧯 Solución de problemas

**La app no se abre / advertencia de Gatekeeper**
→ Clic derecho sobre el icono en `Aplicaciones` → Abrir → confirmar.

**No veo el icono en la barra de menú**
→ Mission Control puede tenerlo en otro escritorio. `cmd+space` → buscar "Pocket Sisyphus".

**El circuito de Tor no se construye**
→ Algunas redes corporativas/universitarias bloquean Tor. Prueba con un hotspot personal.

**El emparejamiento falla**
→ En el modo «Desde cualquier lugar (Tor)», el teléfono y el Mac no necesitan estar en la misma Wi-Fi (LTE/5G está bien), siempre que la app iOS **Pocket Sisyphus.app** haya completado el arranque de Tor (progreso visible en la app). En el modo «Solo la misma Wi-Fi», el teléfono y el Mac DEBEN estar en la misma Wi-Fi.

**Más información**
→ Notas de cada [release](../../releases).

## 📜 Licencia

Este repositorio aloja únicamente binarios precompilados de macOS. La app usa exclusivamente componentes OSS compatibles con BSD/Apache/MIT (Tor, arti, Node.js, etc.).

El código fuente es cerrado por ahora.

## 💬 Feedback / Errores

Abre un [issue](../../issues).
