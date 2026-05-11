# Y7 OS Roadmap

> Building the most accessible AI Linux distribution

---

## Current Release: v0.2.6 (May 2026)

### What's Working
- [x] Bootable ISO (AMD64)
- [x] Debian Bookworm base
- [x] Auto Ollama installation on first boot
- [x] Open WebUI via Docker
- [x] y7-ai, y7-models, y7-status CLI tools
- [x] ZRAM for low-RAM optimization
- [x] Arabic + English locales
- [x] GitHub Actions CI/CD for ISO builds

---

## v0.3.0 — Stability & Hardware (Q2 2026)

### Core Improvements
- [ ] Persistence mode for live USB (save data across reboots)
- [ ] Auto-update system (`y7-update`)
- [ ] Offline model bundling (ship with TinyLlama pre-loaded)
- [ ] Improved first-boot UX with progress indicator

### Hardware Support
- [ ] ARM64 ISO (Raspberry Pi 4/5, Apple Silicon via UTM)
- [ ] NVIDIA GPU detection and driver installation
- [ ] AMD ROCm support for GPU acceleration
- [ ] Intel Arc GPU support

### Tools
- [ ] y7-install tool for on-demand package installation
- [ ] y7-bench benchmarking tool
- [ ] y7-backup for model/config backup

---

## v0.4.0 — AI Power User (Q3 2026)

### Fine-Tuning Pipeline
- [ ] Unsloth integration for fast LoRA training
- [ ] Axolotl for YAML-driven fine-tuning
- [ ] Dataset preparation tools
- [ ] Training progress dashboard

### RAG & Knowledge
- [ ] ChromaDB pre-installed
- [ ] LlamaIndex integration
- [ ] y7-rag CLI for document ingestion
- [ ] Local knowledge base UI

### Voice Interface
- [ ] Whisper for speech-to-text
- [ ] Piper TTS for text-to-speech
- [ ] y7-voice command for voice chat

### Multi-Agent
- [ ] CrewAI integration
- [ ] AutoGen support
- [ ] Agent templates and examples

---

## v0.5.0 — Developer Experience (Q4 2026)

### IDE Integration
- [ ] Continue.dev pre-configured for VS Code
- [ ] Tabby self-hosted Copilot
- [ ] Neovim AI plugins pre-configured

### API & Serving
- [ ] vLLM for high-throughput serving
- [ ] OpenAI-compatible API endpoint
- [ ] API key management
- [ ] Rate limiting and monitoring

### Developer Tools
- [ ] JupyterLab with AI extensions
- [ ] MLflow for experiment tracking
- [ ] Model versioning with DVC

---

## v1.0.0 — Production Ready (Q1 2027)

### Stability
- [ ] LTS (Long Term Support) release
- [ ] Security hardening audit
- [ ] Performance benchmarks published
- [ ] Comprehensive documentation

### Enterprise Features
- [ ] Multi-user support
- [ ] LDAP/SSO integration
- [ ] Audit logging
- [ ] Compliance documentation

### Ecosystem
- [ ] Certified hardware partners
- [ ] Pre-built appliance images
- [ ] Cloud VM images (AWS, GCP, Azure)
- [ ] Docker/Podman images

---

## Future Vision (2027+)

### Mobile Companion
- [ ] Android app for remote access
- [ ] iOS app
- [ ] Voice control from phone

### Edge Computing
- [ ] Kubernetes operator for Y7 OS
- [ ] Edge cluster management
- [ ] Federated learning support

### Specialized Variants
- [ ] Y7 OS Server (headless, optimized for serving)
- [ ] Y7 OS Education (classroom deployment)
- [ ] Y7 OS Medical (HIPAA-ready, medical AI models)
- [ ] Y7 OS Arabic (optimized for Arabic NLP)

---

## How to Contribute

See [CONTRIBUTING.md](CONTRIBUTING.md) for how to help with any of these items.

### Priority Areas
1. **Testing** — Try Y7 OS on different hardware, report issues
2. **Documentation** — Improve guides, translate to other languages
3. **Packaging** — Help package AI tools for Debian
4. **ARM64** — Testing on Raspberry Pi and Apple Silicon

---

## Release Schedule

| Version | Target Date | Focus |
|---------|-------------|-------|
| v0.2.x | May 2026 | Bug fixes, stability |
| v0.3.0 | July 2026 | Hardware support |
| v0.4.0 | October 2026 | AI features |
| v0.5.0 | January 2027 | Developer tools |
| v1.0.0 | April 2027 | Production release |

---

*This roadmap is a living document. Priorities may shift based on community feedback and contributions.*

*Last updated: May 2026*
