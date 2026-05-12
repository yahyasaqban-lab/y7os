# Y7 OS User Manual

> Complete guide to Y7 OS — AI Stack for Linux

**Version:** 0.4.0  
**Last Updated:** May 2026

---

## Table of Contents

1. [Introduction](#introduction)
2. [Installation](#installation)
3. [Getting Started](#getting-started)
4. [Core Tools](#core-tools)
5. [Advanced Tools](#advanced-tools)
6. [System Tools](#system-tools)
7. [Models](#models)
8. [Configuration](#configuration)
9. [Troubleshooting](#troubleshooting)
10. [Arabic Guide](#arabic-guide)

---

## Introduction

### What is Y7 OS?

Y7 OS is a Linux distribution built for running AI locally. It transforms any computer into a private AI workstation without requiring cloud services, subscriptions, or sending data externally.

### Key Features

- **100% Local** — All AI processing happens on your device
- **Low Resource** — Runs on systems with as little as 4GB RAM
- **Offline Capable** — Works without internet after initial setup
- **Bilingual** — Full English and Arabic support
- **Pre-configured** — AI tools ready to use out of the box

### System Requirements

| Component | Minimum | Recommended |
|-----------|---------|-------------|
| RAM | 4 GB | 8 GB+ |
| Storage | 20 GB | 50 GB+ |
| CPU | 64-bit (x86/ARM) | 4+ cores |
| GPU | Not required | NVIDIA (optional) |

---

## Installation

### Option 1: Bootable USB (Recommended)

1. **Download the ISO**
   ```
   AMD64: https://github.com/yahyasaqban-lab/y7os/releases/latest
   ARM64: https://github.com/yahyasaqban-lab/y7os/releases/latest
   ```

2. **Flash to USB**
   ```bash
   # Linux/macOS
   sudo dd if=y7os-0.4.0-amd64.iso of=/dev/sdX bs=4M status=progress
   
   # Or use: Balena Etcher, Rufus, Ventoy
   ```

3. **Boot from USB**
   - Restart computer
   - Press F12/F2/Del for boot menu
   - Select USB device

4. **Login**
   ```
   Username: y7
   Password: y7
   ```

### Option 2: Quick Install Script

Install Y7 OS tools on any existing Linux system:

```bash
curl -fsSL https://raw.githubusercontent.com/yahyasaqban-lab/y7os/main/tools/y7-install | sudo bash
```

### Option 3: Virtual Machine

**VirtualBox:**
1. Create new VM (Debian 64-bit)
2. Allocate 4GB+ RAM, 20GB disk
3. Attach ISO to optical drive
4. Boot and login

**QEMU:**
```bash
qemu-system-x86_64 -m 4G -cdrom y7os-0.4.0-amd64.iso -boot d -enable-kvm
```

---

## Getting Started

### First Boot

On first boot, Y7 OS automatically:
1. Installs Ollama (AI engine)
2. Downloads Open WebUI (chat interface)
3. Pulls a model based on your RAM
4. Configures the system

This takes 5-15 minutes with internet connection.

### Your First AI Chat

```bash
# Interactive chat
y7-ai

# Single question
y7-ai "explain what Docker is"

# Arabic mode
y7-ai --lang ar "ما هو الذكاء الاصطناعي؟"
```

### Web Interface

Open a browser and go to:
```
http://localhost:3000
```

Create a local account (not sent anywhere) and start chatting.

---

## Core Tools

### y7-ai — AI Chat

Interactive AI chat from the command line.

**Usage:**
```bash
y7-ai [options] [question]
```

**Options:**
| Option | Description |
|--------|-------------|
| `--model`, `-m` | Specify model (e.g., `llama3.1:8b`) |
| `--system`, `-s` | Set system prompt |
| `--lang`, `-l` | Language (`en` or `ar`) |
| `--temp`, `-t` | Temperature (0.0-2.0) |
| `--format`, `-f` | Output format (`text` or `json`) |

**Examples:**
```bash
# Interactive mode
y7-ai

# Single question
y7-ai "what is kubernetes?"

# With specific model
y7-ai -m qwen2.5:7b "explain machine learning"

# Pipe input
cat code.py | y7-ai "review this code"

# Custom system prompt
y7-ai -s "You are a Python expert" "how to read CSV files?"

# JSON output
y7-ai -f json "list 3 programming languages"
```

---

### y7-models — Model Management

Download, list, and manage AI models.

**Usage:**
```bash
y7-models <command> [options]
```

**Commands:**
| Command | Description |
|---------|-------------|
| `list` | Show downloaded models |
| `recommend` | Suggest best model for your RAM |
| `download <model>` | Download a model |
| `remove <model>` | Delete a model |
| `search <query>` | Search available models |
| `info <model>` | Show model details |

**Examples:**
```bash
# List installed models
y7-models list

# Get recommendation
y7-models recommend

# Download a model
y7-models download qwen2.5:7b

# Search for coding models
y7-models search code

# Remove a model
y7-models remove tinyllama
```

---

### y7-status — System Dashboard

View system status and AI stack health.

**Usage:**
```bash
y7-status [options]
```

**Options:**
| Option | Description |
|--------|-------------|
| `--compact`, `-c` | Single-line output |
| `--watch`, `-w` | Continuous update |
| `--json`, `-j` | JSON output |
| `--lang`, `-l` | Language (`en` or `ar`) |

**Examples:**
```bash
# Full status
y7-status

# Compact view
y7-status --compact

# Watch mode (updates every 2s)
y7-status --watch

# JSON for scripting
y7-status --json | jq '.ram_used'
```

---

## Advanced Tools

### y7-gpu — GPU Management

Detect and configure GPU acceleration.

**Usage:**
```bash
y7-gpu <command>
```

**Commands:**
| Command | Description |
|---------|-------------|
| `detect` | Detect GPU hardware |
| `install [nvidia\|amd]` | Install drivers |
| `status` | Show GPU status |

**Examples:**
```bash
# Check for GPU
y7-gpu detect

# Install NVIDIA drivers
y7-gpu install nvidia

# View GPU status
y7-gpu status
```

**Supported GPUs:**
- NVIDIA (via proprietary drivers)
- AMD (via open-source amdgpu)
- Intel (via open-source i915)

---

### y7-rag — Document Q&A

Ask questions about your documents using RAG (Retrieval Augmented Generation).

**Usage:**
```bash
y7-rag <command> [options]
```

**Commands:**
| Command | Description |
|---------|-------------|
| `init` | Initialize knowledge base |
| `add <path>` | Add documents |
| `query <question>` | Ask a question |
| `list` | List indexed documents |
| `remove <file>` | Remove a document |
| `status` | Show system status |

**Examples:**
```bash
# Initialize RAG system
y7-rag init

# Add documents
y7-rag add ./documents/
y7-rag add report.pdf

# Ask questions
y7-rag query "what is the main conclusion?"

# List indexed files
y7-rag list
```

**Supported Formats:**
- Text files (.txt, .md)
- PDF documents (.pdf)
- Word documents (.docx)

---

### y7-voice — Voice Interface

Talk to AI using voice input and output.

**Usage:**
```bash
y7-voice <command> [options]
```

**Commands:**
| Command | Description |
|---------|-------------|
| `install` | Install voice components |
| `chat` | Interactive voice chat |
| `listen` | Listen and transcribe |
| `speak <text>` | Text to speech |
| `transcribe <file>` | Transcribe audio file |
| `status` | Check installation |

**Examples:**
```bash
# Install voice components
y7-voice install

# Start voice chat
y7-voice chat

# Listen for 5 seconds
y7-voice listen

# Speak text
y7-voice speak "Hello, how are you?"

# Transcribe audio file
y7-voice transcribe recording.wav
```

**Requirements:**
- Microphone (for input)
- Speakers (for output)
- ~1GB disk space (for models)

---

### y7-serve — API Server

Run AI as an API server for external access.

**Usage:**
```bash
y7-serve <command> [options]
```

**Commands:**
| Command | Description |
|---------|-------------|
| `start` | Start API server |
| `stop` | Stop server |
| `status` | Show server status |
| `webui` | Start Open WebUI |
| `config` | Show configuration |

**Examples:**
```bash
# Check status
y7-serve status

# Start Open WebUI
y7-serve webui

# View configuration
y7-serve config
```

**API Endpoints:**
```
Ollama API:     http://localhost:11434
OpenAI compat:  http://localhost:11434/v1
Open WebUI:     http://localhost:3000
```

---

## System Tools

### y7-update — System Updates

Keep Y7 OS and models up to date.

**Usage:**
```bash
y7-update <command>
```

**Commands:**
| Command | Description |
|---------|-------------|
| `check` | Check for updates |
| `tools` | Update y7-* tools |
| `models` | Update installed models |
| `system` | Update system packages |
| `all` | Update everything |

**Examples:**
```bash
# Check for updates
y7-update check

# Update everything
y7-update all

# Update only tools
y7-update tools

# Update only models
y7-update models
```

---

### y7-backup — Backup & Restore

Backup and restore your Y7 OS configuration and models.

**Usage:**
```bash
y7-backup <command> [options]
```

**Commands:**
| Command | Description |
|---------|-------------|
| `create` | Create backup |
| `restore <file>` | Restore from backup |
| `list` | List backups |
| `delete <file>` | Delete backup |
| `export` | Export models |
| `import <file>` | Import models |

**Options:**
| Option | Description |
|--------|-------------|
| `--models` | Include Ollama models (large!) |
| `--output` | Custom output path |

**Examples:**
```bash
# Create config backup
y7-backup create

# Create full backup with models
y7-backup create --models

# List backups
y7-backup list

# Restore
y7-backup restore y7os-backup-20260513.tar.gz

# Export models only
y7-backup export
```

---

### y7-persist — Persistence Mode

Save data across reboots when running from USB.

**Usage:**
```bash
y7-persist <command>
```

**Commands:**
| Command | Description |
|---------|-------------|
| `setup` | Configure persistence |
| `status` | Check persistence status |
| `backup` | Quick backup |

**Examples:**
```bash
# Check if persistence is active
y7-persist status

# Set up persistence
y7-persist setup
```

---

## Models

### Recommended Models by RAM

| RAM | Model | Command |
|-----|-------|---------|
| 2 GB | TinyLlama | `y7-models download tinyllama` |
| 4 GB | Phi-3 Mini | `y7-models download phi3:mini` |
| 6 GB | Qwen 2.5 7B | `y7-models download qwen2.5:7b` |
| 8 GB | Llama 3.1 8B | `y7-models download llama3.1:8b` |
| 16 GB+ | Llama 3.1 70B | `y7-models download llama3.1:70b-q4` |

### Models for Specific Tasks

**Coding:**
```bash
y7-models download deepseek-coder-v2:6.7b
y7-models download qwen2.5-coder:7b
y7-models download codellama:7b
```

**Arabic:**
```bash
y7-models download qwen2.5:7b      # Best Arabic support
y7-models download llama3.1:8b    # Good Arabic
```

**Embeddings (for RAG):**
```bash
y7-models download nomic-embed-text
```

### Model Quantization

Models come in different sizes:
- **Full (no suffix)** — Best quality, largest size
- **Q8** — Great quality, ~50% smaller
- **Q5** — Good quality, ~35% of original
- **Q4** — Acceptable quality, ~25% of original

Example: `llama3.1:8b-q4` is a 4-bit quantized version.

---

## Configuration

### Environment Variables

| Variable | Description | Default |
|----------|-------------|---------|
| `Y7_LANG` | Default language | `en` |
| `Y7_MODEL` | Default model | auto-detected |
| `OLLAMA_HOST` | Ollama API URL | `http://localhost:11434` |

Set in `~/.bashrc`:
```bash
export Y7_LANG="ar"
export Y7_MODEL="qwen2.5:7b"
```

### Configuration Files

| File | Purpose |
|------|---------|
| `~/.config/y7os/` | Y7 OS configuration |
| `~/.ollama/` | Ollama models and config |
| `~/.y7os/rag/` | RAG knowledge base |
| `~/.y7os/voice/` | Voice models |

---

## Troubleshooting

### Common Issues

**"No model found"**
```bash
# Check if Ollama is running
systemctl status ollama

# Start Ollama
sudo systemctl start ollama

# Download a model
y7-models download tinyllama
```

**"Connection refused"**
```bash
# Restart Ollama
sudo systemctl restart ollama

# Check port
curl http://localhost:11434/api/tags
```

**"Out of memory"**
```bash
# Use a smaller model
y7-models download tinyllama

# Check ZRAM status
systemctl status zramswap
```

**Open WebUI not loading**
```bash
# Check Docker
docker ps

# Restart container
docker restart open-webui

# View logs
docker logs open-webui
```

**First boot stuck**
```bash
# Check internet
ping google.com

# View first-boot log
journalctl -u y7-first-boot

# Run manually
sudo /usr/local/bin/y7-first-boot
```

### Getting Help

- **Documentation:** https://github.com/yahyasaqban-lab/y7os/docs
- **Issues:** https://github.com/yahyasaqban-lab/y7os/issues
- **Discussions:** https://github.com/yahyasaqban-lab/y7os/discussions

---

## Arabic Guide

### البدء السريع

```bash
# تسجيل الدخول
المستخدم: y7
كلمة المرور: y7

# محادثة بالعربية
y7-ai --lang ar

# أو اضبط اللغة الافتراضية
export Y7_LANG=ar
y7-ai
```

### الأوامر الرئيسية

| الأمر | الوصف |
|-------|-------|
| `y7-ai` | محادثة مع الذكاء الاصطناعي |
| `y7-models list` | عرض النماذج المثبتة |
| `y7-models recommend` | اقتراح أفضل نموذج |
| `y7-status` | لوحة حالة النظام |
| `y7-update all` | تحديث كل شيء |

### أفضل النماذج للعربية

| النموذج | الذاكرة | الجودة |
|---------|---------|--------|
| qwen2.5:7b | 6 GB | ممتازة |
| llama3.1:8b | 8 GB | جيدة جداً |
| phi3:mini | 4 GB | مقبولة |

### تثبيت نموذج عربي

```bash
y7-models download qwen2.5:7b
```

### مثال محادثة

```bash
$ y7-ai --lang ar
مرحباً! كيف يمكنني مساعدتك؟

> ما هو الذكاء الاصطناعي؟
الذكاء الاصطناعي هو فرع من علوم الحاسوب يهدف إلى إنشاء 
أنظمة قادرة على أداء مهام تتطلب عادةً الذكاء البشري...
```

---

## Quick Reference Card

```
┌────────────────────────────────────────────────────────┐
│  Y7 OS Quick Reference                                 │
├────────────────────────────────────────────────────────┤
│  CHAT                                                  │
│    y7-ai                    Interactive chat           │
│    y7-ai "question"         Single question            │
│    y7-ai --lang ar          Arabic mode                │
│                                                        │
│  MODELS                                                │
│    y7-models list           Show models                │
│    y7-models recommend      Best for your RAM          │
│    y7-models download X     Download model X           │
│                                                        │
│  SYSTEM                                                │
│    y7-status                System dashboard           │
│    y7-update all            Update everything          │
│    y7-backup create         Backup config              │
│                                                        │
│  ADVANCED                                              │
│    y7-gpu detect            Check for GPU              │
│    y7-rag add ./docs        Add documents              │
│    y7-rag query "question"  Ask about docs             │
│    y7-voice chat            Voice conversation         │
│    y7-serve webui           Start web interface        │
│                                                        │
│  WEB UI                                                │
│    http://localhost:3000    Open WebUI                 │
│                                                        │
│  LOGIN                                                 │
│    Username: y7                                        │
│    Password: y7                                        │
└────────────────────────────────────────────────────────┘
```

---

*Y7 OS — AI for everyone*  
*https://github.com/yahyasaqban-lab/y7os*
