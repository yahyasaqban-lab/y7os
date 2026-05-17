# Y7 OS — Light Mode

A **minimal installation** for constrained hardware or when you just want the CLI tools.

## Install

```bash
sudo ./y7-install --light
```

Or with the minimal `llama.cpp` backend:

```bash
sudo ./y7-install --light --backend llama
```

## What you get

| Component | Light | Full |
|-----------|-------|------|
| Ollama/llama.cpp | ✅ | ✅ |
| CLI tools (y7-ai, y7-code, etc.) | ✅ | ✅ |
| ZRAM compression | ✅ | ✅ |
| Python, Git, build tools | ✅ | ✅ |
| Docker | ❌ | ✅ |
| Open WebUI | ❌ | ✅ |
| Web dashboard | ✅ (y7-web) | ✅ (y7-web) |

## When to use Light Mode

- **Raspberry Pi / SBCs** — 4GB RAM, no Docker overhead
- **Old laptops** — 4-8GB RAM, every megabyte counts
- **Headless servers** — CLI-only, no browser needed
- **Quick dev setup** — minimal install in seconds
- **Containers / CI** — isolated environments

## What's missing

- **Docker**: Manage containers manually with `apt install docker.io`
- **Open WebUI**: Install later via `docker run -d -p 3000:8080 ghcr.io/open-webui/open-webui:latest`
- **GPU drivers**: Install NVIDIA/AMD drivers separately

## Conversions

```bash
# Light → Full: just install Docker
sudo apt install docker.io docker-compose-v2
sudo systemctl enable --now docker

# Full → Light: remove Docker (careful — destroys all containers)
sudo apt purge docker-ce docker-ce-cli containerd.io
```
