# Y7 OS Complete Tool Reference

> 94+ AI and developer tools, pre-installed or one command away

---

## Pre-installed Tools (Tier 1)

These tools are installed automatically on first boot.

### AI Engines

| Tool | Command | Description |
|------|---------|-------------|
| Ollama | `ollama` | Local LLM runner |
| llama.cpp | `llama-cpp-python` | CPU-first inference |
| LocalAI | `local-ai` | OpenAI API replacement |
| Open WebUI | http://localhost:3000 | ChatGPT-like web UI |

### AI CLI Tools

| Tool | Command | Description |
|------|---------|-------------|
| Claude Code | `claude` | Anthropic's CLI agent |
| Gemini CLI | `gemini` | Google's terminal agent |
| Copilot CLI | `gh copilot` | GitHub's coding agent |
| Codex CLI | `codex` | OpenAI's terminal agent |
| OpenCode | `opencode` | Open-source, 75+ providers |
| OpenClaw | `openclaw` | Personal AI assistant |
| Aider | `aider` | AI pair programming |
| Open Interpreter | `interpreter` | Natural language computer control |
| Shell-GPT | `sgpt` | ChatGPT in terminal |
| Fabric | `fabric` | AI prompt patterns |
| Mods | `mods` | AI for pipes |
| LLM | `llm` | Multi-backend CLI |
| aicommits | `aicommits` | Auto git commit messages |
| Goose | `goose` | Open-source AI agent |

### Hugging Face Stack

| Tool | Import | Description |
|------|--------|-------------|
| huggingface-hub | `huggingface_hub` | Hub interaction |
| transformers | `transformers` | Model framework |
| datasets | `datasets` | Dataset loading |
| accelerate | `accelerate` | Distributed training |
| peft | `peft` | Parameter-efficient fine-tuning |
| trl | `trl` | RLHF/DPO training |
| sentence-transformers | `sentence_transformers` | Embeddings |

### Fine-Tuning Tools

| Tool | Command | Description |
|------|---------|-------------|
| Unsloth | `unsloth` | 2-5x faster LoRA |
| Axolotl | `axolotl` | YAML-driven fine-tuning |
| LLaMA-Factory | `llamafactory` | Unified fine-tuning |

### Python AI Stack

| Tool | Import | Description |
|------|--------|-------------|
| chromadb | `chromadb` | Vector database |
| qdrant-client | `qdrant_client` | Qdrant client |
| openai-whisper | `whisper` | Speech-to-text |
| langchain | `langchain` | AI framework |
| llama-index | `llama_index` | RAG framework |
| autogen | `autogen` | Multi-agent |
| crewai | `crewai` | Multi-agent |
| gradio | `gradio` | Quick AI UIs |
| streamlit | `streamlit` | Data apps |
| opencv | `cv2` | Computer vision |
| easyocr | `easyocr` | Better OCR |

### Developer Tools

| Tool | Command | Description |
|------|---------|-------------|
| gh | `gh` | GitHub CLI |
| socat | `socat` | Network plumbing |
| netcat | `nc` | Network utility |
| jq | `jq` | JSON processor |
| yq | `yq` | YAML processor |
| ripgrep | `rg` | Ultra-fast grep |
| fd | `fd` | Better find |
| fzf | `fzf` | Fuzzy finder |
| bat | `bat` | Better cat |
| exa | `exa` / `ls` | Better ls |
| tmux | `tmux` | Terminal multiplexer |
| htop | `htop` | System monitor |
| btop | `btop` | Better monitor |
| ranger | `ranger` | File manager |
| lazygit | `lazygit` | Git TUI |
| lazydocker | `lazydocker` | Docker TUI |
| zoxide | `z` | Smart cd |
| neofetch | `neofetch` | System info |

### Media & Vision

| Tool | Command | Description |
|------|---------|-------------|
| ffmpeg | `ffmpeg` | Video/audio processing |
| imagemagick | `convert` | Image manipulation |
| yt-dlp | `yt-dlp` | Download videos |
| tesseract | `tesseract` | OCR |

### Data & Science

| Tool | Import | Description |
|------|--------|-------------|
| pandas | `pandas` | Data processing |
| numpy | `numpy` | Numerical computing |
| matplotlib | `matplotlib` | Charts |
| plotly | `plotly` | Interactive charts |
| duckdb | `duckdb` | SQL analytics |
| sympy | `sympy` | Symbolic math |
| scipy | `scipy` | Scientific computing |
| scikit-learn | `sklearn` | ML algorithms |

### Security

| Tool | Command | Description |
|------|---------|-------------|
| gpg | `gpg` | Encryption |
| age | `age` | Simple encryption |
| wireguard | `wg` | VPN |
| tor | `tor` | Anonymity |
| ufw | `ufw` | Firewall |
| fail2ban | `fail2ban-client` | Intrusion prevention |

### Infrastructure

| Tool | Command | Description |
|------|---------|-------------|
| Docker | `docker` | Containers |
| Podman | `podman` | Rootless containers |
| docker-compose | `docker-compose` | Multi-container apps |
| nginx | `nginx` | Reverse proxy |
| certbot | `certbot` | SSL certs |
| pm2 | `pm2` | Process manager |

---

## On-demand Tools (Tier 2)

Install with `y7-install <tool>`

| Tool | Install Command | Description |
|------|-----------------|-------------|
| vLLM | `y7-install vllm` | High-throughput serving |
| ExLlamaV2 | `y7-install exllama` | Fast GPTQ inference |
| LibreChat | `y7-install librechat` | Multi-provider UI |
| text-generation-webui | `y7-install textgen-webui` | Gradio UI |
| AnythingLLM | `y7-install anythingllm` | Document chat |
| PrivateGPT | `y7-install privategpt` | Private documents |
| Unsloth Studio | `y7-install unsloth-studio` | No-code training |
| Tabby | `y7-install tabby` | Self-hosted Copilot |
| Continue | `y7-install continue` | VS Code AI |
| Cody | `y7-install cody` | Sourcegraph AI |
| Genkit | `y7-install genkit` | Google AI framework |
| TGI | `y7-install tgi` | HF Text Generation |
| Mergekit | `y7-install mergekit` | Model merging |
| JupyterLab | `y7-install jupyter` | Notebooks |
| Caddy | `y7-install caddy` | Auto-HTTPS proxy |
| Bark | `y7-install bark` | Text-to-speech |
| Coqui TTS | `y7-install coqui-tts` | Text-to-speech |
| MLflow | `y7-install mlflow` | Experiment tracking |
| W&B | `y7-install wandb` | Weights & Biases |

---

## Models

Download models with `y7-models download <name>` or `ollama pull <name>`

### General Purpose

| Model | RAM | Command |
|-------|-----|---------|
| TinyLlama | 2GB | `ollama pull tinyllama` |
| Phi-3 Mini | 4GB | `ollama pull phi3:mini` |
| Gemma 2 2B | 3GB | `ollama pull gemma2:2b` |
| Qwen 2.5 7B | 6GB | `ollama pull qwen2.5:7b` |
| Mistral 7B | 6GB | `ollama pull mistral:7b` |
| Llama 3.1 8B | 8GB | `ollama pull llama3.1:8b` |
| Hermes 3 8B | 8GB | `ollama pull hermes3:8b` |

### Code Specialists

| Model | RAM | Command |
|-------|-----|---------|
| DeepSeek Coder | 6GB | `ollama pull deepseek-coder-v2:6.7b` |
| CodeLlama | 6GB | `ollama pull codellama:7b` |
| CodeGemma | 6GB | `ollama pull codegemma:7b` |
| StarCoder 2 | 6GB | `ollama pull starcoder2:7b` |
| Qwen 2.5 Coder | 6GB | `ollama pull qwen2.5-coder:7b` |

### Embeddings

| Model | Size | Command |
|-------|------|---------|
| nomic-embed-text | 137M | `ollama pull nomic-embed-text` |
| bge-large | 335M | `ollama pull bge-large` |

---

## Quick Reference

```bash
# Chat with AI
y7-ai

# Manage models
y7-models list
y7-models recommend
y7-models download qwen2.5:7b

# System status
y7-status

# Install additional tools
y7-install <tool>

# Open WebUI
# Browser: http://localhost:3000

# Use AI CLIs
sgpt "explain this code"
aider --model ollama/llama3.1
mods "summarize" < file.txt
claude
gemini
```

---

## Aliases

These aliases are pre-configured in `~/.bashrc`:

```bash
ai        → y7-ai
models    → y7-models
status    → y7-status
ls        → exa --icons
ll        → exa -la --icons
cat       → bat
grep      → rg
find      → fd
```

---

*Y7 OS — AI Stack for Linux*
*https://github.com/yahyasaqban-lab/y7os*
