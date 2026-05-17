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
  <a href=".github/workflows/test-installer.yml"><img src="https://github.com/yahyasaqban-lab/y7os/actions/workflows/test-installer.yml/badge.svg" alt="Installer Tests"></a>
  <a href=".github/workflows/shellcheck.yml"><img src="https://github.com/yahyasaqban-lab/y7os/actions/workflows/shellcheck.yml/badge.svg" alt="ShellCheck"></a>
  <a href="https://pre-commit.com/"><img src="https://img.shields.io/badge/pre--commit-enabled-brightgreen?style=flat-square&logo=pre-commit" alt="pre-commit"></a>
</p>

<p align="center">
  <a href="#quick-install">⚡ Quick Install</a> •
  <a href="#download">Download ISO</a> •
  <a href="#features">Features</a> •
  <a href="#quick-start">Quick Start</a> •
  <a href="#documentation">Docs</a> •
  <a href="#roadmap">Roadmap</a>
</p>

---

## ⚡ Quick Install (New! v0.1.0)

**Turn any Linux machine into an AI workstation in one command:**

```bash
curl -fsSL https://raw.githubusercontent.com/yahyasaqban-lab/y7os/main/tools/y7-install | sudo bash
```

Or download and run locally:
```bash
wget https://raw.githubusercontent.com/yahyasaqban-lab/y7os/main/tools/y7-install
chmod +x y7-install
sudo ./y7-install
```

### What the installer does:
- ✅ Auto-detects your hardware (RAM, CPU, GPU, device type)
- ✅ Picks the best AI backend — **Ollama** (8GB+) or **llama.cpp** (4-8GB)
- ✅ Installs Python, Docker, Open WebUI
- ✅ Sets up Y7 CLI tools
- ✅ Enables ZRAM compression for low-resource devices
- ✅ All in English **or Arabic** — auto-detects your language

### Options
```bash
sudo ./y7-install --lang ar              # Force Arabic
sudo ./y7-install --backend llama         # Force llama.cpp
sudo ./y7-install --dry-run --verbose     # Simulate first
sudo ./y7-install --skip-validation       # Skip post-install checks
```

**Compatible with:** Ubuntu 20.04+, Debian 11+, CentOS 8+, Raspberry Pi OS
**Minimum:** 4GB RAM, 20GB storage

> 📖 Full installer docs: [docs/INSTALLING.md](docs/INSTALLING.md)
> 🧪 Test suite: [tools/test-installer.sh](tools/test-installer.sh)
> 🔧 CI/CD: [.github/workflows/test-installer.yml](.github/workflows/test-installer.yml)

---

---

## What is Y7 OS?

Y7 OS is a **Linux distribution built for local AI**. It turns any computer — even old laptops with 4GB RAM — into a private AI workstation. No cloud. No subscriptions. No data leaving your device.

```
┌─────────────────────────────────────────────────────────────┐
│  Y7 OS v0.3.0                                               │
│                                                             │
│  ┌─────────────┐  ┌─────────────┐  ┌─────────────┐         │
│  │   Ollama    │  │  Open WebUI │  │   Docker    │         │
│  │  (LLMs)     │  │  (Chat UI)  │  │ (Containers)│         │
│  └─────────────┘  └─────────────┘  └─────────────┘         │
│                                                             │
│  ┌─────────────────────────────────────────────────┐       │
│  │  y7-ai │ y7-models │ y7-status │ y7-gpu │ y7-persist   │
│  └─────────────────────────────────────────────────┘       │
│                                                             │
│  ┌─────────────────────────────────────────────────┐       │
│  │       Debian Bookworm (AMD64 + ARM64)           │       │
│  └─────────────────────────────────────────────────┘       │
└─────────────────────────────────────────────────────────────┘
```

---

## Download

### Latest Release: v0.3.0

| Architecture | Download | Size | Use Case |
|--------------|----------|------|----------|
| **AMD64** | [y7os-0.3.0-amd64.iso](https://github.com/yahyasaqban-lab/y7os/releases/download/v0.3.0/y7os-0.3.0-amd64.iso) | ~1.5 GB | Intel/AMD PCs, laptops |
| **ARM64** | [y7os-0.3.0-arm64.iso](https://github.com/yahyasaqban-lab/y7os/releases/download/v0.3.0/y7os-0.3.0-arm64.iso) | ~1.5 GB | Raspberry Pi 4/5, Pine64 |

**Checksums:** [AMD64](https://github.com/yahyasaqban-lab/y7os/releases/download/v0.3.0/y7os-0.3.0-amd64.iso.sha256) | [ARM64](https://github.com/yahyasaqban-lab/y7os/releases/download/v0.3.0/y7os-0.3.0-arm64.iso.sha256)

### What's New in v0.3.0
- **ARM64 support** — Raspberry Pi 4/5, Apple Silicon (via UTM)
- **NVIDIA GPU detection** — `y7-gpu detect` and driver installation
- **Persistence mode** — Save data across reboots with `y7-persist`
- **TinyLlama bundled** — Works offline immediately!

### Flash to USB

```bash
# Linux/macOS
sudo dd if=y7os-0.3.0-amd64.iso of=/dev/sdX bs=4M status=progress

# Or use Balena Etcher, Rufus, Ventoy
```

---

## Features

### Pre-installed AI Stack
- **Ollama** — Local LLM inference (auto-selected for 8GB+ RAM)
- **llama.cpp** — Lightweight alternative (auto-selected for 4-8GB)
- **Open WebUI** — ChatGPT-like interface at localhost:3000
- **Docker** — For Open WebUI and extensibility

### Optimized for Low Resources
- Auto-detects RAM, CPU, GPU; picks smallest working model
- ZRAM compression enabled on devices with <8GB RAM
- Light mode: `--light` flag installs only Ollama + CLI tools
- Works on 4GB RAM machines, Raspberry Pi, old laptops

### Privacy First
- Everything runs locally — no data leaves your machine
- No accounts, no subscriptions, no telemetry
- All models are open-source quantized variants

### Arabic + English Native
- Auto-detects system language
- All tools respond bilingually
- Full Arabic install: `sudo ./y7-install --lang ar`

## CLI Tools (v0.2.0)

| Tool | Description |
|------|-------------|
| `y7-ai` | AI chat launcher, auto-picks best model for your RAM |
| `y7-code` | Code review, generation, translation across 6 languages |
| `y7-models` | Model manager (list, download, remove, info) |
| `y7-agents` | Autonomous AI agents for multi-step tasks |
| `y7-rag` | RAG pipeline (ingest docs, query with context) |
| `y7-voice` | Voice command interface for the AI |
| `y7-serve` | REST API server for all Y7 tools |
| `y7-web` | Web dashboard at localhost:9090 |
| `y7-backup` | Backup models, configs, and user data |
| `y7-status` | Real-time terminal dashboard |
| `y7-doctor` | Diagnose and fix common issues |
| `y7-update` | Self-update tools from GitHub |

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

## Security

Found a vulnerability? Please report it responsibly. See [SECURITY.md](SECURITY.md).

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
