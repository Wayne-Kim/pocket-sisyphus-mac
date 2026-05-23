# Privacy Policy — Pocket Sisyphus

_Last updated: 2026-05-24_

Pocket Sisyphus is an iPhone “remote control” for coding-agent CLIs running on your
own Mac (Claude Code, Google Antigravity, etc.). It is designed to be **fully
distributed**: no servers, no analytics, no crash reporting, no data collection
of any kind by the developer.

If you have any question about this policy you can reach us by opening an issue
on the public bug tracker: <https://github.com/Wayne-Kim/pocket-sisyphus-mac/issues>.

## TL;DR

* We **do not** collect, store, transmit, sell, or share any personal data.
* We **do not** run any backend server, analytics service, ad SDK, or
  crash-reporting service.
* All traffic stays inside the Tor onion circuit between your iPhone and your
  own Mac — the developer never sees it.
* When the agent calls a model provider (Anthropic, Google, …), that traffic
  goes directly to the provider and is governed by that provider’s own privacy
  policy, **not** ours.

## 1. What the app does, in one paragraph

The iPhone app is a remote terminal. After a one-time pairing, it talks to the
Pocket Sisyphus desktop daemon (a separate macOS app you install on your own
Mac) over a Tor v3 onion service that only you can reach. The desktop daemon
runs the coding-agent CLI of your choice, which in turn calls the model
provider you’ve configured (Anthropic Claude API, Google Gemini API, …).
**No part of this pipeline crosses any server we operate.** We have none.

## 2. What stays on your iPhone

The following items live on the device, never sent anywhere by us:

* Bearer token (created at pairing) — `UserDefaults`.
* Tor v3 client-authorization key — the embedded Tor instance’s
  `ClientOnionAuthDir/.auth_private` file.
* Your selected display language and other UI preferences — `UserDefaults`.
* Pairing state and last-known onion address — `UserDefaults`.

Uninstalling the app or signing out of pairing removes these.

## 3. What stays on your Mac

When you install the desktop app (separate download) it stores:

* The onion service’s long-term keypair (so the address survives reboots).
* The bearer token shared with paired phones.
* The agent CLI’s session history (whatever Claude Code / Antigravity already
  store under `~/.claude/projects` etc. — those are not Pocket Sisyphus files
  and we do not change their format).
* A small SQLite cache of session metadata.

All of these live under your own home directory. We never see them.

## 4. What flows across the network

Every request from the phone is wrapped in three layers of Tor onion encryption
and lands directly at the daemon on your Mac. The daemon then talks to the
model provider you’ve configured. The full flow:

    iPhone (Pocket Sisyphus)
      → on-device Tor
      → public Tor network (3-hop onion routing)
      → Tor hidden service on your Mac
      → Pocket Sisyphus daemon (127.0.0.1 only)
      → coding-agent CLI (Claude Code / Google Antigravity / …)
      → model-provider API (Anthropic / Google / …)

No step touches a server operated by the Pocket Sisyphus author.

## 5. Third parties

The only third parties involved are:

1. **The Tor network** — volunteer relays that carry encrypted onion traffic.
   They cannot decrypt the contents and they don’t know who is on either end
   of the circuit. See <https://www.torproject.org/about/history/>.
2. **The model provider you choose** (Anthropic, Google, …) — receives the
   prompts and code context that the agent CLI sends on your behalf. This is
   governed by the model provider’s own privacy policy, e.g.
   <https://www.anthropic.com/legal/privacy> or
   <https://policies.google.com/privacy>.

We are not a party to either of these — we simply route your traffic into them.

## 6. Children

The app does not target children, does not collect data from anyone, and
contains no advertising or in-app purchase content directed at children.

## 7. Account / login

There is no account. There is no email signup. There is no developer-side
profile, ID, identifier, advertising token, fingerprint, IP log, or session
record kept by us. Authentication is local: a bearer token and a Tor
client-auth key, generated at pairing time and stored only on your two devices.

## 8. Cookies and tracking

The app does not embed any web view used for tracking, any analytics SDK,
any A/B testing service, any ad SDK, or any third-party telemetry. There are
no cookies because there is no web destination operated by us.

## 9. Data subject rights (GDPR / CCPA / etc.)

Because the developer never receives or processes any personal data, there is
nothing in our possession to access, correct, or delete. If you want to remove
all local state, uninstall the iPhone app and delete
`~/Library/Application Support/PocketSisyphus/` on your Mac.

Requests about data held by third parties (Anthropic, Google, …) must go
directly to those providers under their respective policies.

## 10. Security

* Every request is end-to-end encrypted by Tor’s onion-routing layer.
* The daemon binds to `127.0.0.1` only — it is not reachable from the local
  network or the public internet; only the Tor onion is the entry point.
* Authentication is double — onion v3 (Ed25519 key) plus a bearer token plus a
  Tor v3 client-authorization key. Anyone missing any one of these cannot
  reach the daemon.

If you discover a security issue please report it via
<https://github.com/Wayne-Kim/pocket-sisyphus-mac/issues> and we will respond
within a reasonable time.

## 11. Changes to this policy

If the privacy posture of the app changes in a material way (e.g. a new
component starts to collect data), this document will be updated and the “Last
updated” date at the top will move. There is no mailing list — please re-read
this page from the App Store listing if you want to check.

## 12. Contact

* GitHub issues — <https://github.com/Wayne-Kim/pocket-sisyphus-mac/issues>
* Email — wayne@soomgo.com
