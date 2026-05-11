# CLI Reference

Complete reference for Y7 OS command-line tools.

---

## y7-ai

Interactive AI chat and single-query mode.

### Usage

```bash
y7-ai [OPTIONS] [QUERY]
```

### Options

| Option | Description | Default |
|--------|-------------|---------|
| `--model`, `-m` | Model to use | auto-detected |
| `--system`, `-s` | System prompt | none |
| `--lang`, `-l` | Language (en/ar) | en |
| `--temp`, `-t` | Temperature (0.0-2.0) | 0.7 |
| `--format`, `-f` | Output format (text/json) | text |
| `--no-stream` | Disable streaming output | streaming on |
| `--help`, `-h` | Show help | |
| `--version`, `-v` | Show version | |

### Examples

```bash
# Interactive chat
y7-ai

# Single question
y7-ai "what is kubernetes?"

# With specific model
y7-ai -m llama3.1:8b "explain docker"

# Arabic mode
y7-ai --lang ar "ما هو الذكاء الاصطناعي؟"

# Custom system prompt
y7-ai -s "You are a Python expert" "how to read a CSV file?"

# Pipe input
cat code.py | y7-ai "review this code"

# JSON output
y7-ai -f json "list 3 Linux distros"

# Low creativity (precise answers)
y7-ai -t 0.1 "what is 2+2?"

# High creativity
y7-ai -t 1.5 "write a haiku about code"
```

### Environment Variables

| Variable | Description |
|----------|-------------|
| `Y7_MODEL` | Default model |
| `Y7_LANG` | Default language |
| `OLLAMA_HOST` | Ollama server URL |

---

## y7-models

Model management tool.

### Usage

```bash
y7-models <command> [OPTIONS]
```

### Commands

| Command | Description |
|---------|-------------|
| `list` | List downloaded models |
| `recommend` | Suggest best model for your RAM |
| `download <model>` | Download a model |
| `remove <model>` | Delete a model |
| `search <query>` | Search available models |
| `info <model>` | Show model details |
| `update` | Update model list |

### Examples

```bash
# List downloaded models
y7-models list

# Get RAM-based recommendation
y7-models recommend

# Download a model
y7-models download qwen2.5:7b

# Download specific quantization
y7-models download llama3.1:8b-q4_0

# Remove a model
y7-models remove tinyllama

# Search for code models
y7-models search code

# Show model info
y7-models info phi3:mini
```

### Model Naming

Models use the format: `name:variant`

- `llama3.1:8b` — Llama 3.1, 8 billion parameters
- `phi3:mini` — Phi-3, mini variant
- `qwen2.5:7b-q4` — Qwen 2.5, 7B parameters, Q4 quantization

### Quantization Guide

| Suffix | Size | Quality | Speed |
|--------|------|---------|-------|
| (none) | Large | Best | Slow |
| `-q8` | Medium | Great | Medium |
| `-q5` | Small | Good | Fast |
| `-q4` | Tiny | OK | Fastest |

---

## y7-status

System status dashboard.

### Usage

```bash
y7-status [OPTIONS]
```

### Options

| Option | Description | Default |
|--------|-------------|---------|
| `--compact`, `-c` | Compact single-line output | full |
| `--watch`, `-w` | Continuous update mode | off |
| `--json`, `-j` | JSON output | off |
| `--lang`, `-l` | Language (en/ar) | en |

### Examples

```bash
# Full status
y7-status

# Compact mode
y7-status --compact

# Watch mode (updates every 2s)
y7-status --watch

# JSON for scripting
y7-status --json | jq '.ram_used'

# Arabic
y7-status --lang ar
```

### Output Sections

1. **System** — Hostname, uptime, kernel
2. **Resources** — CPU, RAM, disk usage
3. **AI Stack** — Ollama status, loaded models
4. **Services** — Docker, Open WebUI, first-boot
5. **Network** — IP addresses, connectivity

---

## y7-bench

System benchmarking tool.

### Usage

```bash
y7-bench [OPTIONS]
```

### Options

| Option | Description |
|--------|-------------|
| `--quick` | Fast benchmark (30s) |
| `--full` | Complete benchmark (5min) |
| `--model <name>` | Test specific model |
| `--save` | Save results to file |

### Examples

```bash
# Quick benchmark
y7-bench --quick

# Full benchmark
y7-bench --full

# Test specific model
y7-bench --model phi3:mini

# Save results
y7-bench --save
```

---

## y7-install

On-demand tool installer.

### Usage

```bash
y7-install <tool>
```

### Available Tools

```bash
y7-install vllm          # High-throughput serving
y7-install jupyter       # JupyterLab
y7-install tabby         # Self-hosted Copilot
y7-install librechat     # Multi-provider UI
y7-install anythingllm   # Document chat
y7-install mergekit      # Model merging
```

### Examples

```bash
# Install JupyterLab
y7-install jupyter

# List available tools
y7-install --list
```

---

## Ollama (Direct)

Y7 OS includes Ollama. You can use it directly:

```bash
# Run a model
ollama run llama3.1:8b

# Pull a model
ollama pull mistral:7b

# List models
ollama list

# Remove a model
ollama rm tinyllama

# Model info
ollama show phi3:mini

# Serve API (already running as service)
ollama serve

# API endpoint
curl http://localhost:11434/api/generate -d '{
  "model": "phi3:mini",
  "prompt": "Hello"
}'
```

---

## Docker Commands

Common Docker operations:

```bash
# List containers
docker ps

# Restart Open WebUI
docker restart open-webui

# View logs
docker logs -f open-webui

# Stop all containers
docker stop $(docker ps -q)

# Pull latest Open WebUI
docker pull ghcr.io/open-webui/open-webui:main
```

---

## Aliases

Pre-configured in `~/.bashrc`:

```bash
ai        → y7-ai
models    → y7-models
status    → y7-status

# Enhanced CLI
ls        → exa --icons
ll        → exa -la --icons
cat       → bat
grep      → rg
find      → fd
```

---

## Configuration

### Y7 OS Config

```bash
~/.config/y7os/config.yaml
```

### Ollama Config

```bash
# Service config
/etc/systemd/system/ollama.service

# Model storage
~/.ollama/models/
```

### Environment

Add to `~/.bashrc`:

```bash
export Y7_MODEL="qwen2.5:7b"
export Y7_LANG="ar"
export OLLAMA_HOST="http://localhost:11434"
```

---

*Y7 OS v0.2.6 — CLI Reference*
