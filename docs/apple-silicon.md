# Y7 OS on Apple Silicon (M1/M2/M3/M4)

## Two Ways

| Method | Description | Best For |
|--------|-------------|----------|
| **Asahi Linux** (native) | ARM64 Linux natively on Mac | Performance, GPU |
| **VM** (UTM/VMware) | Inside macOS | Testing, dual-boot |

## Option 1: Asahi Linux (Recommended)
1. Install Asahi: https://asahilinux.org
2. Boot, open terminal: `curl -fsSL https://raw.githubusercontent.com/yahyasaqban-lab/y7os/main/scripts/asahi/install-asahi.sh | sudo bash`
3. Get: Ollama + Metal GPU (2-3x faster), Open WebUI, y7-ai, y7-code

### Performance (Metal GPU)
| Mac | RAM | Model | Speed |
|-----|-----|-------|-------|
| M1 Air | 8GB | phi4:mini | ~30 tok/s |
| M1 Pro | 16GB | llama3.1:8b | ~25 tok/s |
| M2/M3 | 16GB+ | mistral:7b | ~35 tok/s |
| M3 Max | 32GB+ | qwen2.5:14b | ~40 tok/s |

## Option 2: UTM / VMware Fusion VM
- UTM: `brew install --cask utm` → + → Virtualize → Linux → y7os arm64 ISO
- VMware: File → New → Install from ISO
- 4GB RAM, 2 CPUs, 20GB disk min
- Login: y7 / y7
- No GPU pass-through (CPU only)

## Commands
```bash
y7-ai "hello"
y7-code review file.py
y7-models list
y7-web
y7-status
```
