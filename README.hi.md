<!--
Languages: 한국어 · English · 日本語 · العربية · Español · Français · हिन्दी (default) · Português (BR) · Русский · 简体中文
-->

# Pocket Sisyphus (Mac के लिए)

[한국어](README.md) · [English](README.en.md) · [日本語](README.ja.md) · [العربية](README.ar.md) · [Español](README.es.md) · [Français](README.fr.md) · **हिन्दी** · [Português (BR)](README.pt-BR.md) · [Русский](README.ru.md) · [简体中文](README.zh-Hans.md)

> आपके Mac पर चल रहे Claude Code को फोन से सुरक्षित रूप से नियंत्रित करने वाला macOS ऐप।
> **Tor onion service** आधारित · **शून्य बाहरी सर्वर** · **शून्य पेड सेवाएँ** · **100% OSS कंपोनेंट**।

## 📥 डाउनलोड

नवीनतम बिल्ड [Releases पेज](../../releases/latest) से प्राप्त करें:

```
PocketSisyphusMac-v<संस्करण>-build<नंबर>.dmg
```

DMG Apple Developer ID से साइन किया गया है और Apple notarization पास कर चुका है — Gatekeeper बिना चेतावनी के खोल देता है।

## 🧰 सिस्टम आवश्यकताएँ

| आइटम | न्यूनतम |
|---|---|
| macOS | 13.0 (Ventura) या उससे ऊपर |
| CPU | Apple Silicon या Intel |
| डिस्क | लगभग 400 MB (Node.js + Tor बंडल सहित) |
| नेटवर्क | कोई भी इंटरनेट कनेक्शन (firewall/router सेटअप की आवश्यकता नहीं) |

## 🚀 इंस्टॉल

1. `PocketSisyphusMac-v*.dmg` पर डबल-क्लिक करें।
2. **Pocket Sisyphus.app** को **Applications** फ़ोल्डर में ड्रैग करें।
3. Launchpad या Spotlight से **Pocket Sisyphus** लॉन्च करें।

> ⚠️ यदि Gatekeeper "unidentified developer" चेतावनी दिखाता है, तो notarization टिकट अभी तक स्थानीय रूप से कैश नहीं हुआ है। आइकन पर **राइट-क्लिक → Open** एक बार करें; उसके बाद macOS इसे याद रखेगा।

## 📱 पहली बार लॉन्च — फोन को पेयर करना

1. पहले लॉन्च पर daemon स्वचालित रूप से एक Tor onion service बनाता है (`xxxxx.onion`)।
2. मेनू बार आइकन → **Show Pairing QR**।
3. iOS के **Pocket Sisyphus** ऐप (TestFlight) में QR स्कैन करें।
4. अब आपका फोन किसी भी LTE/5G/Wi-Fi नेटवर्क से Tor के माध्यम से Mac तक पहुँच सकता है।

पेयरिंग के बाद आप फोन से चैट, Approval, और फ़ाइल बदलावों की समीक्षा कर सकते हैं।

## 🛡️ सुरक्षा मॉडल

- **कोई बाहरी सर्वर नहीं** — मेंटेनर का कोई इन्फ्रास्ट्रक्चर नहीं, केवल Tor नेटवर्क।
- **NAT/CGNAT से प्रभावित नहीं** — दोनों छोर outbound से Tor से जुड़ते हैं, port-forwarding की ज़रूरत नहीं।
- **दोहरी प्रमाणीकरण** — `.onion` एड्रेस (Ed25519 की) + Bearer टोकन।
- **daemon केवल 127.0.0.1 पर बाइंड होता है** — सीधे एक्सेस नहीं, केवल Tor onion ही प्रवेश बिंदु है।

## 🧯 समस्या निवारण

**ऐप नहीं खुल रहा / Gatekeeper चेतावनी**
→ `Applications` फ़ोल्डर में आइकन पर राइट-क्लिक → Open → पुष्टि करें।

**मेनू बार में आइकन नहीं दिख रहा**
→ Mission Control में यह किसी अन्य डेस्कटॉप पर हो सकता है। `cmd+space` → "Pocket Sisyphus" खोजें।

**Tor सर्किट नहीं बन रहा**
→ कुछ कॉर्पोरेट/स्कूल नेटवर्क Tor को ब्लॉक करते हैं। पर्सनल हॉटस्पॉट से प्रयास करें।

**पेयरिंग विफल**
→ फोन और Mac को एक ही Wi-Fi पर होना ज़रूरी नहीं है। फोन का LTE/5G भी ठीक है। लेकिन iOS के **Pocket Sisyphus.app** ने Tor बूटस्ट्रैप पूरा कर लिया होना चाहिए (प्रगति ऐप में दिखती है)।

**अधिक जानकारी**
→ प्रत्येक [release](../../releases) के नोट्स देखें।

## 📜 लाइसेंस

यह रिपॉज़िटरी केवल प्रीबिल्ट macOS बायनरीज़ होस्ट करती है। ऐप विशेष रूप से BSD/Apache/MIT-संगत OSS कंपोनेंट (Tor, arti, Node.js आदि) उपयोग करता है।

स्रोत कोड फिलहाल क्लोज़्ड-सोर्स है।

## 💬 फीडबैक / बग

[Issues](../../issues) में रिपोर्ट करें।
