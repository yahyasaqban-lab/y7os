# Y7 OS — Architecture

## Overview

Y7 OS is structured in four layers, each with a clear responsibility. The design principle is: **every layer should be replaceable without breaking the others.**

```
┌─────────────────────────────────────────────────────┐
│  Layer 4 — Y7 Shell                                 │
│  y7-install  y7-models  y7-ai  y7-status            │
├─────────────────────────────────────────────────────┤
│  Layer 3 — AI Stack                                 │
│  Ollama  •  llama.cpp  •  Open WebUI  •  Jan.ai     │
├─────────────────────────────────────────────────────┤
│  Layer 2 — Runtime                                  │
│  Python 3.11  •  Docker  •  Git  •  Node.js         │
├─────────────────────────────────────────────────────┤
│  Layer 1 — Base                                     │
│  LFS Kernel  •  musl libc  •  BusyBox               │
└─────────────────────────────────────────────────────┘
```

---

## Layer 1 — Base

The foundation. Built using Linux From Scratch (LFS) to keep the image small and auditable.

| Component | Choice | Why |
|---|---|---|
| Kernel | Linux 6.6 LTS (minimal config) | Stability + long support window |
| C library | musl libc | 1/10th size of glibc, no memory leaks |
| Core utilities | BusyBox | 300+ tools in one ~1MB binary |
| Init system | BusyBox init | Simple, no systemd overhead |
| Package manager | y7-pkg (custom) | Zero deps, shell script, GitHub releases |

**Target image size:** ~200MB base, ~800MB with AI stack installed.

---

## Layer 2 — Runtime

Tools needed to run the AI stack and support developer workflows.

| Component | Version | Purpose |
|---|---|---|
| Python | 3.11 | Ollama deps, Open WebUI, scripts |
| Docker | Latest stable | Open WebUI container |
| Git | 2.x | Version control, tool updates |
| Node.js | 20 LTS | Open WebUI build deps |
| curl/wget | System | Downloads, API calls |

---

## Layer 3 — AI Stack

The core AI capability. Multiple backends coexist — `y7-ai` selects the right one at runtime.

### Inference Backends

**llama.cpp**
- Direct C++ inference, no Python overhead
- Lowest RAM footprint
- Built with CPU-specific flags (AVX2/NEON)
- Used when RAM is limited or Ollama is unavailable

**Ollama**
- REST API wrapper around llama.cpp
- Easier model management
- Supports model hot-swapping
- Used when RAM is comfortable

### Interfaces

**Open WebUI**
- Browser-based chat interface
- Connects to Ollama's API
- Supports RAG (document upload), voice, image
- RTL/Arabic support enabled

**Jan.ai**
- Desktop Electron app
- Works fully offline
- Built-in model manager

---

## Layer 4 — Y7 Shell

Custom tools that make Y7 OS feel like a product.

### y7-install

Entry point. Detects hardware, installs appropriate stack, configures system, downloads starter model.

```
y7-install
  ├── detect_hardware()      → CPU, RAM, arch, AVX2
  ├── preflight_checks()     → RAM/disk minimums, OS compat
  ├── setup_zram()           → compressed RAM swap
  ├── install_dependencies() → apt/dnf/pacman
  ├── install_ollama()       → with y7 config overrides
  ├── create_ai_structure()  → /ai/{models,prompts,outputs}
  ├── install_y7_tools()     → y7-status, y7-models, y7-ai
  ├── download_starter_model() → auto-selected by RAM
  └── install_webui()        → Open WebUI via Docker
```

### y7-ai

Intelligent launcher. Selects backend based on free RAM at runtime.

```
y7-ai [model]
  ├── get_free_ram()
  ├── >12GB → Ollama full performance
  ├── 6-12GB → Ollama with limits
  ├── 3-6GB → llama.cpp
  └── <3GB  → llama.cpp minimal model
```

### y7-models

Model lifecycle manager.

```
y7-models
  ├── list       → ollama list
  ├── available  → registry table with RAM indicators
  ├── download   → short name → ollama tag resolution
  ├── switch     → ollama run
  ├── delete     → ollama rm with confirmation
  ├── info       → registry details + RAM check
  ├── recommend  → hardware-aware suggestion
  ├── search     → registry keyword search
  └── update     → pull all installed models
```

### y7-status

System dashboard. Shows RAM, CPU, disk, ZRAM, and service status.

---

## Key Design Decisions

### Why LFS instead of Alpine/Debian?

Alpine was considered. LFS was chosen because:
1. Complete control over every binary in the image
2. No inherited package manager decisions
3. Learning value for contributors — you understand everything in the OS
4. Smaller final image than Alpine with AI stack

### Why musl instead of glibc?

- ~600KB vs ~2MB
- Stricter standards compliance catches bugs early
- No known ABI breakage history
- llama.cpp and Ollama both compile cleanly against musl

### Why Ollama + llama.cpp instead of just one?

They serve different use cases:
- **llama.cpp**: maximum efficiency, lowest RAM, no daemon overhead
- **Ollama**: better UX, REST API for Open WebUI, easier model management

`y7-ai` picks the right one per session automatically.

### Why not support GPU out of the box?

Y7 OS's target audience (4GB RAM devices, old laptops, Pi) doesn't have discrete GPUs. GPU support adds complexity, driver hell, and bloat for 95% of target users. GPU support may be added as an optional module in v2.0.

---

## /ai/ Directory

Y7 OS creates a unique `/ai/` top-level directory — unconventional but intentional.

```
/ai/
├── models/     Downloaded .gguf files and Ollama model data
├── prompts/    Reusable prompt templates (Arabic + English)
├── outputs/    Saved AI responses
└── logs/       Inference logs for debugging
```

Keeping AI data in `/ai/` instead of `~/.ollama` or `/var/` makes it:
- Easy to find for new users
- Easy to back up
- Easy to mount on a separate drive
- Visible as a first-class part of the OS

---

## File Structure

```
/
├── ai/                    Y7 OS AI workspace
├── boot/                  Kernel + bootloader
├── etc/y7/                Y7 configuration files
│   ├── ollama.conf
│   ├── zram-setup.sh
│   └── optimize.sh
├── opt/
│   ├── ollama/
│   ├── llama.cpp/
│   └── open-webui/
└── usr/local/bin/
    ├── y7-ai
    ├── y7-models
    ├── y7-status
    └── y7-install
```
