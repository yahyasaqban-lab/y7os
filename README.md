<div align="center">

<h1>Y7 OS</h1>

<p><strong>AI Stack for Linux — runs on any hardware</strong><br/>
<em>مكدس الذكاء الاصطناعي للينكس</em></p>

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Version](https://img.shields.io/badge/Version-0.1.0-green.svg)]()
[![Platform](https://img.shields.io/badge/Platform-Ubuntu%20%7C%20Debian-orange.svg)]()

</div>

---

## Quick Install

```bash
curl -fsSL https://raw.githubusercontent.com/yahyasaqban-lab/y7os/main/tools/y7-install | bash
```

**What it does:**
- Installs Ollama (local AI inference)
- Sets up Docker + Open WebUI
- Configures ZRAM (compressed swap)
- Downloads the best AI model for your RAM
- Installs y7 tools (y7-ai, y7-models, y7-status)

---

## Requirements

| Minimum | Recommended |
|---------|-------------|
| Ubuntu/Debian | Ubuntu 22.04+ |
| 4 GB RAM | 8 GB RAM |
| 10 GB disk | 20 GB disk |
| Internet | Internet |

---

## Tools

### y7-ai
Intelligent AI launcher — detects your RAM and picks the best model.

```bash
y7-ai                      # Interactive chat
y7-ai "explain bash"       # Single prompt
cat code.py | y7-ai        # Pipe input
y7-ai --model mistral      # Use specific model
y7-ai --lang ar            # Arabic mode
```

### y7-models
Manage AI models — download, switch, delete, recommend.

```bash
y7-models list             # Show downloaded models
y7-models recommend        # Best model for your RAM
y7-models download phi3    # Download a model
y7-models available        # Browse all models
```

### y7-status
System dashboard — RAM, CPU, disk, Ollama status.

```bash
y7-status                  # Show dashboard
y7-status --lang ar        # Arabic
```

---

## Model Guide

| Model | RAM | Best for |
|-------|-----|----------|
| tinyllama | 2 GB | Ultra-low RAM |
| gemma:2b | 3 GB | Fast responses |
| phi3:mini | 4 GB | Best quality/size ratio |
| mistral:7b-q4 | 6 GB | General purpose |
| qwen2:7b | 6 GB | Best Arabic support |
| llama3.1:8b | 8 GB | Best quality |

---

## v0.1.0 Release Notes

First working release:
- y7-install works on Ubuntu/Debian
- y7-ai, y7-models, y7-status tools
- Ollama + Docker + Open WebUI setup
- ZRAM auto-configuration
- Arabic language support (--lang ar)

---

## العربية

### التثبيت السريع

```bash
curl -fsSL https://raw.githubusercontent.com/yahyasaqban-lab/y7os/main/tools/y7-install | bash
```

### الأدوات

```bash
y7-ai --lang ar            # محادثة بالعربية
y7-status --lang ar        # لوحة الحالة
y7-models recommend        # أفضل نموذج لجهازك
```

### النماذج المدعومة للعربية

| النموذج | الذاكرة | جودة العربية |
|---------|---------|--------------|
| qwen2:7b | 6 GB | ممتازة |
| llama3.1:8b | 8 GB | جيدة جداً |
| phi3:mini | 4 GB | جيدة |

---

## Contributing

See [docs/contributing.md](docs/contributing.md)

## License

MIT — free forever

---

<div align="center">

**Built by Yahya — For everyone**

<div align="center">

**Built by Yahya — For everyone**

[Issues](https://github.com/yahyasaqban-lab/y7os/issues) · [Docs](docs/)

---

## 🤖 Contributors

| | |
|---|---|
| 🧠 **DeepSeek AI** | Signal generation & trading models |
| 🐉 **Claude (Anthropic)** | Agent orchestration & automation |

---

*Y7 OS is an AI-first Linux distro — built with AI, for everyone.*

</div>
