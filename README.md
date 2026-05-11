<p align="center">
  <img src="branding/y7os-logo.svg" alt="Y7 OS" width="200"/>
</p>

<h1 align="center">Y7 OS</h1>

<p align="center">
  <strong>AI Stack for Linux — runs on any hardware</strong><br/>
  <em>مكدس الذكاء الاصطناعي للينكس — يعمل على أي جهاز</em>
</p>

<p align="center">
  <a href="https://github.com/yahyasaqban-lab/y7os/releases/latest"><img src="https://img.shields.io/github/v/release/yahyasaqban-lab/y7os?style=flat-square&color=blue" alt="Release"></a>
  <a href="LICENSE"><img src="https://img.shields.io/badge/License-MIT-green.svg?style=flat-square" alt="License"></a>
  <a href="https://github.com/yahyasaqban-lab/y7os/stargazers"><img src="https://img.shields.io/github/stars/yahyasaqban-lab/y7os?style=flat-square" alt="Stars"></a>
  <a href="https://y7os.dev"><img src="https://img.shields.io/badge/Website-y7os.dev-purple?style=flat-square" alt="Website"></a>
</p>

<p align="center">
  <a href="#download">Download</a> •
  <a href="#features">Features</a> •
  <a href="#quick-start">Quick Start</a> •
  <a href="#documentation">Docs</a> •
  <a href="#roadmap">Roadmap</a>
</p>

---

## What is Y7 OS?

Y7 OS is a **Linux distribution built for local AI**. It turns any computer — even old laptops with 4GB RAM — into a private AI workstation. No cloud. No subscriptions. No data leaving your device.

```
┌─────────────────────────────────────────────────────────────┐
│  Y7 OS v0.2.6                                               │
│                                                             │
│  ┌─────────────┐  ┌─────────────┐  ┌─────────────┐         │
│  │   Ollama    │  │  Open WebUI │  │   Docker    │         │
│  │  (LLMs)     │  │  (Chat UI)  │  │ (Containers)│         │
│  └─────────────┘  └─────────────┘  └─────────────┘         │
│                                                             │
│  ┌─────────────────────────────────────────────────┐       │
│  │  y7-ai  │  y7-models  │  y7-status  │  y7-bench │       │
│  └─────────────────────────────────────────────────┘       │
│                                                             │
│  ┌─────────────────────────────────────────────────┐       │
│  │              Debian Bookworm Base               │       │
│  └─────────────────────────────────────────────────┘       │
└─────────────────────────────────────────────────────────────┘
```

---

## Download

### Latest Release: v0.2.6

| Architecture | Download | Size |
|--------------|----------|------|
| **AMD64** (Intel/AMD) | [y7os-0.2.6-amd64.iso](https://github.com/yahyasaqban-lab/y7os/releases/download/v0.2.6/y7os-0.2.6-amd64.iso) | 982 MB |

**Checksum:** [SHA256](https://github.com/yahyasaqban-lab/y7os/releases/download/v0.2.6/y7os-0.2.6-amd64.iso.sha256)

### Flash to USB

```bash
# Linux/macOS
sudo dd if=y7os-0.2.6-amd64.iso of=/dev/sdX bs=4M status=progress

# Or use Balena Etcher, Rufus, Ventoy
```

---

## Features

### Pre-installed AI Stack
- **Ollama** — Run LLMs locally (Llama, Mistral, Qwen, Phi)
- **Open WebUI** — ChatGPT-like interface at `localhost:3000`
- **Docker** — Container runtime for AI tools
- **y7 Tools** — CLI tools for AI management

### Optimized for Low Resources
- **4GB RAM minimum** — runs on old laptops
- **ZRAM enabled** — compressed swap for better performance
- **Auto model selection** — picks the best model for your RAM

### Privacy First
- **100% local** — no data leaves your device
- **No accounts required** — no sign-ups, no tracking
- **Offline capable** — works without internet after setup

### Arabic + English Native
- **Full Arabic support** — RTL, locales, keyboard
- **Bilingual tools** — `y7-ai --lang ar`

---

## Quick Start

### 1. Boot & Login
```
Username: y7
Password: y7
```

### 2. Start Chatting
```bash
y7-ai                      # Interactive chat
y7-ai "explain kubernetes" # Single question
```

### 3. Open Web UI
```
http://localhost:3000
```

### 4. Manage Models
```bash
y7-models list            # Show downloaded models
y7-models recommend       # Best model for your RAM
y7-models download phi3   # Download a model
```

### 5. System Status
```bash
y7-status                 # Dashboard
y7-bench                  # Benchmark your system
```

---

## System Requirements

| Spec | Minimum | Recommended |
|------|---------|-------------|
| **RAM** | 4 GB | 8 GB+ |
| **Storage** | 20 GB | 50 GB+ |
| **CPU** | 64-bit x86 | 4+ cores |
| **Internet** | Required for first boot | Optional after setup |

### Model RAM Guide

| Model | RAM Required | Quality |
|-------|--------------|---------|
| TinyLlama | 2 GB | Basic |
| Phi-3 Mini | 4 GB | Good |
| Qwen 2.5 7B | 6 GB | Great (Arabic) |
| Llama 3.1 8B | 8 GB | Best |

---

## Documentation

- [Installation Guide](docs/guides/installation.md)
- [Getting Started](docs/guides/getting-started.md)
- [Model Guide](docs/models.md)
- [CLI Reference](docs/guides/cli-reference.md)
- [Architecture](docs/architecture.md)
- [FAQ](docs/guides/faq.md)

---

## Roadmap

### v0.3.0 — Q2 2026
- [ ] ARM64 support (Raspberry Pi, Apple Silicon)
- [ ] GPU acceleration (NVIDIA, AMD)
- [ ] Persistence mode for live USB
- [ ] Auto-update system

### v0.4.0 — Q3 2026
- [ ] Fine-tuning tools (Unsloth, Axolotl)
- [ ] RAG pipeline (ChromaDB, LlamaIndex)
- [ ] Voice interface (Whisper, TTS)
- [ ] Mobile companion app

### v1.0.0 — Q4 2026
- [ ] Stable release
- [ ] Enterprise support
- [ ] Certified hardware partners

See [ROADMAP.md](ROADMAP.md) for details.

---

## العربية

### التحميل

قم بتحميل ملف ISO من [صفحة الإصدارات](https://github.com/yahyasaqban-lab/y7os/releases/latest)

### البدء السريع

```bash
# تسجيل الدخول
المستخدم: y7
كلمة المرور: y7

# محادثة بالعربية
y7-ai --lang ar

# لوحة الحالة
y7-status --lang ar

# أفضل نموذج لجهازك
y7-models recommend
```

### النماذج المدعومة للعربية

| النموذج | الذاكرة | جودة العربية |
|---------|---------|--------------|
| qwen2.5:7b | 6 GB | ممتازة |
| llama3.1:8b | 8 GB | جيدة جداً |
| phi3:mini | 4 GB | جيدة |

---

## Contributing

We welcome contributions! See [CONTRIBUTING.md](CONTRIBUTING.md).

```bash
git clone https://github.com/yahyasaqban-lab/y7os.git
cd y7os
make build
```

---

## Community

- **Website:** [y7os.dev](https://y7os.dev)
- **GitHub:** [github.com/yahyasaqban-lab/y7os](https://github.com/yahyasaqban-lab/y7os)
- **Twitter/X:** [@y7os_ai](https://twitter.com/y7os_ai)

---

## License

MIT License — free forever. See [LICENSE](LICENSE).

---

<p align="center">
  <strong>Built by <a href="https://github.com/yahyasaqban">Yahya Saqban</a> — Kuwait 🇰🇼</strong><br/>
  <em>For everyone who deserves access to AI</em>
</p>

<p align="center">
  🧠 <strong>AI Contributors:</strong> DeepSeek AI • Claude (Anthropic)
</p>
