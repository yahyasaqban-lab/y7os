<div align="center">

<h1>🤖 Y7 OS</h1>

<p><strong>The AI-first Linux distro for low-resource hardware.</strong><br/>
<em>توزيعة لينكس مخصصة للذكاء الاصطناعي على الأجهزة المحدودة الموارد.</em></p>

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)
[![Status: Planning](https://img.shields.io/badge/Status-Planning-yellow.svg)]()
[![Arabic Support](https://img.shields.io/badge/Language-Arabic%20%2B%20English-green.svg)]()
[![Privacy First](https://img.shields.io/badge/Privacy-100%25%20Local-red.svg)]()
[![Platform](https://img.shields.io/badge/Platform-x86__64%20%7C%20ARM-lightgrey.svg)]()

</div>

---

## 🇬🇧 English

### What is Y7 OS?

Y7 OS is an AI-first Linux distribution built from scratch for people who want to run local AI on **any hardware** — without a GPU, without a cloud subscription, and without compromising privacy.

It runs on old laptops, Raspberry Pi, VPS servers, and ARM single-board computers. It speaks Arabic and English natively. And it installs with one command.

### ✨ Key Features

- 🧠 **Local AI by default** — Ollama + llama.cpp + Open WebUI pre-configured
- ⚡ **Low-resource optimized** — runs on 4GB RAM with ZRAM compression
- 🌐 **Arabic & English native** — full RTL support, bilingual interface
- 🔒 **Privacy-first** — zero telemetry, zero cloud, works fully offline
- 🔄 **Adaptive backend** — auto-switches AI engine based on available RAM
- 🛠️ **Developer-ready** — Python, Git, Docker pre-installed
- 📦 **One-command install** — zero configuration required

### 🚀 Quick Start

```bash
curl -fsSL https://raw.githubusercontent.com/yahyasaqban-lab/y7os/main/tools/y7-install | bash
```

> ⚠️ **Status:** Y7 OS is currently in the planning/early development stage. The install script is not yet available. Star the repo to follow progress.

### 💻 Hardware Support

| Device | Min RAM | Recommended Model | Backend |
|---|---|---|---|
| Raspberry Pi 4/5 | 4 GB | Phi-3 Mini | llama.cpp |
| Old Laptop (Intel) | 4 GB | Mistral 7B Q4 | llama.cpp / Ollama |
| Old Laptop (AMD) | 8 GB | Llama 3.1 8B Q4 | Ollama |
| VPS (2–4 vCPU) | 4 GB | Phi-3 / TinyLlama | llama.cpp headless |
| Modern Laptop | 16 GB | Llama 3.1 70B Q4 | Ollama |

### 🧱 Architecture

```
┌─────────────────────────────────────────────┐
│  Layer 4 — Y7 Shell                         │
│  y7-cli  •  y7-models  •  y7-ai             │
├─────────────────────────────────────────────┤
│  Layer 3 — AI Stack                         │
│  Ollama  •  llama.cpp  •  Open WebUI        │
├─────────────────────────────────────────────┤
│  Layer 2 — Runtime                          │
│  Python 3.11  •  Docker  •  Git             │
├─────────────────────────────────────────────┤
│  Layer 1 — Base                             │
│  LFS Kernel  •  musl libc  •  BusyBox       │
└─────────────────────────────────────────────┘
```

### 🗺️ Roadmap

| Version | Goal | Status |
|---|---|---|
| v0.1 | y7-install script works on Ubuntu/Debian | 🔄 In Progress |
| v0.2 | Full AI stack auto-configured + Open WebUI | 📋 Planned |
| v0.5 | y7-models CLI + y7-status + Arabic support | 📋 Planned |
| v0.8 | Custom LFS kernel + minimal base image | 📋 Planned |
| v0.9 | Bootable ISO, tested on 5+ hardware targets | 📋 Planned |
| v1.0 | Public release + full documentation | 📋 Planned |

### 🤝 Contributing

Y7 OS is open to contributors at all levels. See [CONTRIBUTING.md](docs/contributing.md) for how to help.

Areas we need help with:
- Shell scripting (y7-install, y7-models)
- ARM hardware testing (Raspberry Pi)
- Arabic localization
- Documentation

### 📄 License

MIT — free forever, for everyone.

---

## 🇸🇦 العربية

### ما هو Y7 OS؟

Y7 OS هو نظام تشغيل لينكس مبني من الصفر، مصمم خصيصاً للذكاء الاصطناعي المحلي على **أي جهاز** — بدون كارت شاشة قوي، بدون اشتراك سحابي، وبدون التنازل عن الخصوصية.

يعمل على اللابتوبات القديمة، وRaspberry Pi، وخوادم VPS، وأجهزة ARM. يدعم العربية والإنجليزية بشكل أصلي. ويُثبَّت بأمر واحد فقط.

### ✨ المميزات الرئيسية

- 🧠 **ذكاء اصطناعي محلي بالكامل** — Ollama + llama.cpp + Open WebUI جاهزة للاستخدام
- ⚡ **محسّن للأجهزة المحدودة** — يعمل على 4GB RAM مع ضغط ZRAM
- 🌐 **عربي وإنجليزي أصلي** — دعم كامل للكتابة من اليمين لليسار
- 🔒 **الخصوصية أولاً** — بدون إرسال بيانات، يعمل بدون إنترنت
- 🔄 **تبديل ذكي للمحرك** — يختار أفضل محرك AI حسب الذاكرة المتاحة
- 🛠️ **جاهز للمطورين** — Python وGit وDocker مثبتة مسبقاً
- 📦 **تثبيت بأمر واحد** — لا حاجة لأي إعدادات

### 🚀 البداية السريعة

```bash
curl -fsSL https://raw.githubusercontent.com/yahyasaqban-lab/y7os/main/tools/y7-install | bash
```

> ⚠️ **الحالة الحالية:** Y7 OS في مرحلة التخطيط والتطوير المبكر. اضغط Star لمتابعة التقدم.

### 💻 الأجهزة المدعومة

| الجهاز | الذاكرة الدنيا | النموذج الموصى به | المحرك |
|---|---|---|---|
| Raspberry Pi 4/5 | 4 GB | Phi-3 Mini | llama.cpp |
| لابتوب قديم (Intel) | 4 GB | Mistral 7B Q4 | llama.cpp / Ollama |
| لابتوب قديم (AMD) | 8 GB | Llama 3.1 8B Q4 | Ollama |
| VPS (2–4 vCPU) | 4 GB | Phi-3 / TinyLlama | llama.cpp headless |
| لابتوب حديث | 16 GB | Llama 3.1 70B Q4 | Ollama |

### 🗺️ خارطة الطريق

| الإصدار | الهدف | الحالة |
|---|---|---|
| v0.1 | سكريبت y7-install يعمل على Ubuntu/Debian | 🔄 قيد التطوير |
| v0.2 | تثبيت كامل لمكدس الذكاء الاصطناعي | 📋 مخطط |
| v0.5 | أدوات y7-models وy7-status ودعم العربية | 📋 مخطط |
| v0.8 | نواة LFS مخصصة وصورة قاعدية | 📋 مخطط |
| v1.0 | إصدار عام + توثيق كامل | 📋 مخطط |

### 🤝 المساهمة

Y7 OS مفتوح للمساهمين من جميع المستويات. راجع [CONTRIBUTING.md](docs/contributing.md) للبدء.

### 📄 الرخصة

MIT — مجاني للجميع، للأبد.

---

<div align="center">

**Built by Yahya — For everyone — Forever open**<br/>
**بُني بواسطة يحيى — للجميع — مفتوح للأبد**

[GitHub](https://github.com/yahyasaqban-lab/y7os) • [Issues](https://github.com/yahyasaqban-lab/y7os/issues) • [Discussions](https://github.com/yahyasaqban-lab/y7os/discussions)

</div>
