# Getting Started with Y7 OS

Welcome to Y7 OS! This guide will help you start using AI on your local machine.

---

## Quick Start (2 minutes)

```bash
# Login
Username: y7
Password: y7

# Start chatting
y7-ai

# Or ask a single question
y7-ai "explain quantum computing simply"
```

That's it! You're running AI locally.

---

## Core Commands

### y7-ai — Chat with AI

```bash
# Interactive mode
y7-ai

# Single question
y7-ai "write a Python function to reverse a string"

# Arabic mode
y7-ai --lang ar

# Specify model
y7-ai --model mistral:7b "explain kubernetes"

# Pipe input
cat error.log | y7-ai "explain this error"
```

### y7-models — Manage Models

```bash
# List downloaded models
y7-models list

# Get recommendation for your RAM
y7-models recommend

# Download a model
y7-models download qwen2.5:7b

# Remove a model
y7-models remove tinyllama

# Search available models
y7-models search "code"
```

### y7-status — System Dashboard

```bash
# Full status
y7-status

# Compact view
y7-status --compact

# Arabic
y7-status --lang ar

# Watch mode (updates every 2s)
y7-status --watch
```

---

## Web Interface

Open WebUI provides a ChatGPT-like experience:

1. Open browser: `http://localhost:3000`
2. Create account (local only, not sent anywhere)
3. Start chatting

### Features
- Multiple conversations
- File uploads (PDFs, images)
- Code highlighting
- Export conversations
- Custom system prompts

### Start/Stop Web UI

```bash
# Check if running
docker ps | grep open-webui

# Start
docker start open-webui

# Stop
docker stop open-webui

# Restart
docker restart open-webui
```

---

## Model Selection Guide

| Your RAM | Recommended Model | Install Command |
|----------|-------------------|-----------------|
| 2-3 GB | TinyLlama | `y7-models download tinyllama` |
| 4 GB | Phi-3 Mini | `y7-models download phi3:mini` |
| 6 GB | Qwen 2.5 7B | `y7-models download qwen2.5:7b` |
| 8 GB | Llama 3.1 8B | `y7-models download llama3.1:8b` |
| 16 GB+ | Llama 3.1 70B (Q4) | `y7-models download llama3.1:70b-q4` |

### For Arabic
- **Best:** Qwen 2.5 7B — excellent Arabic support
- **Good:** Llama 3.1 8B — decent Arabic
- **Basic:** Phi-3 — limited Arabic

### For Coding
```bash
y7-models download deepseek-coder-v2:6.7b  # Best for code
y7-models download codellama:7b            # Good alternative
y7-models download qwen2.5-coder:7b        # Great for both
```

---

## Useful Aliases

These are pre-configured in your shell:

```bash
ai        # → y7-ai
models    # → y7-models
status    # → y7-status
```

---

## Examples

### Code Generation
```bash
y7-ai "write a bash script to backup my home directory"
```

### Explain Code
```bash
cat script.py | y7-ai "explain this code"
```

### Git Commit Messages
```bash
git diff | y7-ai "write a commit message for these changes"
```

### Translate
```bash
y7-ai "translate to Arabic: Hello, how are you?"
```

### Summarize
```bash
cat document.txt | y7-ai "summarize this in 3 bullet points"
```

### Debug Errors
```bash
cat error.log | y7-ai "what's wrong and how to fix it?"
```

---

## Advanced Usage

### Use Multiple Models
```bash
# Download several models
y7-models download phi3:mini
y7-models download qwen2.5:7b
y7-models download deepseek-coder-v2:6.7b

# Switch between them
y7-ai --model phi3:mini "quick question"
y7-ai --model deepseek-coder-v2:6.7b "write Python code for..."
```

### System Prompts
```bash
y7-ai --system "You are a Linux expert" "how do I find large files?"
```

### JSON Output
```bash
y7-ai --format json "list 5 programming languages with their use cases"
```

### Temperature (Creativity)
```bash
# More creative (higher temperature)
y7-ai --temp 0.9 "write a poem about Linux"

# More precise (lower temperature)
y7-ai --temp 0.1 "explain how TCP works"
```

---

## Tips

1. **Low RAM?** Close browser tabs and other apps before running AI
2. **Slow responses?** Use a smaller model
3. **Need Arabic?** Qwen 2.5 is the best choice
4. **Coding tasks?** Use DeepSeek Coder or Qwen Coder
5. **Offline?** Models work without internet after download

---

## Next Steps

- [CLI Reference](cli-reference.md) — Full command documentation
- [Model Guide](../models.md) — Detailed model comparison
- [FAQ](faq.md) — Common questions

---

*Y7 OS — AI for everyone*
