# Y7 OS on Apple Silicon (M1/M2/M3/M4)

## Overview
Y7 OS runs on any Apple Silicon Mac via **UTM** (free, open-source VM) or **VMware Fusion**.

Since macOS cannot boot an ARM64 Linux ISO natively, you run it inside a virtual machine.

## Quick Start (UTM — Recommended)

### 1. Install UTM
Download from: https://mac.getutm.app/
Or via Homebrew:
```bash
brew install --cask utm
```

### 2. Create a New VM
1. Open UTM → `+` → **Virtualize**
2. Select **Linux**
3. **Boot ISO image:** Browse and select `y7os-*-arm64.iso`
4. **Hardware:**
   - RAM: 4GB+ (recommended: 8GB)
   - CPU: 2+ cores
   - Disk: 20GB+
5. **Save and run**

### 3. Boot & Login
- Login: `y7` / `y7`
- Run Y7 AI: `y7-ai`
- The ISO works immediately — TinyLlama is pre-installed

### 4. Post-Install (Optional)
For better performance, install to VM disk:
```bash
sudo y7-install
```

## Quick Start (VMware Fusion)

1. Download VMware Fusion Pro (free for personal use)
2. File → New → Install from ISO
3. Select `y7os-*-arm64.iso`
4. Configure: 4GB RAM, 2 CPUs, 20GB disk
5. Boot and login: `y7` / `y7`

## Performance Notes

| CPU | RAM | Performance | Use Case |
|-----|-----|-------------|----------|
| M1 | 4GB | Basic | Learning, CLI AI tools |
| M1 Pro+ | 8GB | Good | Open WebUI, Ollama |
| M2/M3 | 8GB+ | Great | AI models, Docker |
| M3 Max/Ultra | 16GB+ | Excellent | Production AI workloads |

## Known Limitations

- **No GPU passthrough** — UTM/VMware don't support NVIDIA CUDA on Apple Silicon
- **ARM64 AI models only** — Some AI models require x86 emulation (slower)
- **USB boot not supported** — Macs don't boot ARM64 Linux ISOs from USB
- Use VM or cloud deployment for full experience

## Commands Available

```bash
y7-ai           # Launch AI assistant
y7-models       # Manage AI models
y7-status       # System status dashboard
y7-gpu detect   # Check GPU (will be CPU on VM)
y7-persist      # Manage persistence
```

## Pro Tips
- UTM supports **shared folders** between macOS and Y7 OS
- Enable **clipboard sharing** in UTM for copy/paste
- For production, install to disk (not live USB) — better I/O performance
