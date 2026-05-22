<!--
Languages: 한국어 · English · 日本語 · العربية · Español (default) · Français · हिन्दी · Português (BR) · Русский · 简体中文
-->

# Pocket Sisyphus para Mac

[한국어](README.md) · [English](README.en.md) · [日本語](README.ja.md) · [العربية](README.ar.md) · **Español** · [Français](README.fr.md) · [हिन्दी](README.hi.md) · [Português (BR)](README.pt-BR.md) · [Русский](README.ru.md) · [简体中文](README.zh-Hans.md)

> Una app para macOS que te permite controlar de forma segura Claude Code (Codex CLI y Gemini CLI próximamente) corriendo en tu Mac desde tu teléfono.
> Basada en **servicios onion de Tor** · **cero servidores** · **cero servicios de pago** · **componentes 100% OSS**.

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

## 🚀 Instalación

1. Haz doble clic en `PocketSisyphusMac-v*.dmg`.
2. Arrastra **Pocket Sisyphus.app** a la carpeta **Aplicaciones**.
3. Inicia **Pocket Sisyphus** desde Launchpad o Spotlight.

> ⚠️ Si Gatekeeper muestra "desarrollador no identificado", el ticket de notarización aún no se ha cacheado localmente. Haz clic derecho sobre el icono → **Abrir** una vez; macOS lo recordará a partir de entonces.

## 📱 Primer arranque — Emparejar el teléfono

1. En el primer arranque, el daemon crea automáticamente un servicio onion de Tor (`xxxxx.onion`).
2. Icono de la barra de menú → **Show Pairing QR**.
3. Escanea el QR con la app iOS **Pocket Sisyphus** (TestFlight).
4. Tu teléfono ya puede llegar al Mac vía Tor desde cualquier red LTE/5G/Wi-Fi.

Una vez emparejados, puedes chatear, aprobar cambios (Approval) y revisar diffs de archivos desde el teléfono.

## 🛡️ Modelo de seguridad

- **Cero servidores externos** — sin infraestructura del mantenedor, solo la red Tor.
- **Funciona detrás de NAT/CGNAT** — ambos extremos conectan salientes (outbound) a Tor, sin port-forwarding.
- **Doble autenticación** — dirección `.onion` (clave Ed25519) + token Bearer.
- **El daemon escucha solo en 127.0.0.1** — no es accesible directamente, solo a través del onion de Tor.

## 🧯 Solución de problemas

**La app no se abre / advertencia de Gatekeeper**
→ Clic derecho sobre el icono en `Aplicaciones` → Abrir → confirmar.

**No veo el icono en la barra de menú**
→ Mission Control puede tenerlo en otro escritorio. `cmd+space` → buscar "Pocket Sisyphus".

**El circuito de Tor no se construye**
→ Algunas redes corporativas/universitarias bloquean Tor. Prueba con un hotspot personal.

**El emparejamiento falla**
→ El teléfono y el Mac no necesitan estar en la misma Wi-Fi. LTE/5G del teléfono está bien. Pero la app iOS **Pocket Sisyphus.app** debe haber completado el arranque de Tor (progreso visible en la app).

**Más información**
→ Notas de cada [release](../../releases).

## 📜 Licencia

Este repositorio aloja únicamente binarios precompilados de macOS. La app usa exclusivamente componentes OSS compatibles con BSD/Apache/MIT (Tor, arti, Node.js, etc.).

El código fuente es cerrado por ahora.

## 💬 Feedback / Errores

Abre un [issue](../../issues).
