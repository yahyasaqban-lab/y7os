# Frequently Asked Questions

## General

### What is Y7 OS?
Y7 OS is a Linux distribution designed for running AI locally. It comes with Ollama, Open WebUI, and 94+ AI tools pre-installed. It works on any x86_64 computer, even old laptops with 4GB RAM.

### Is it free?
Yes, completely free and open source under the MIT license.

### Does it send my data anywhere?
No. Everything runs locally on your computer. No cloud, no accounts, no tracking.

### Do I need internet?
Only for the first boot (to download Ollama and models). After that, everything works offline.

### Can I install it alongside Windows/macOS?
Currently, Y7 OS runs as a live system from USB. You can use it without affecting your existing OS. Dual-boot installation is planned for v1.0.

---

## Hardware

### What are the minimum requirements?
- 4GB RAM
- 20GB storage
- 64-bit x86 CPU (Intel or AMD)

### Will it run on my old laptop?
Probably! Y7 OS is optimized for low-resource systems. If your laptop can run Debian Linux, it can run Y7 OS.

### Does it support Raspberry Pi?
Not yet. ARM64 support (Raspberry Pi 4/5) is planned for v0.3.0.

### Does it support Apple Silicon Macs?
Not natively, but you can run it in UTM (emulation). Native ARM64 support is coming.

### Does it support NVIDIA GPUs?
GPU support is planned for v0.3.0. Currently, all inference runs on CPU.

---

## Models

### Which model should I use?
Run `y7-models recommend` to get a suggestion based on your RAM.

| RAM | Model | Quality |
|-----|-------|---------|
| 2-3 GB | TinyLlama | Basic |
| 4 GB | Phi-3 Mini | Good |
| 6 GB | Qwen 2.5 7B | Great |
| 8 GB+ | Llama 3.1 8B | Best |

### Which model is best for Arabic?
Qwen 2.5 7B has excellent Arabic support. It needs 6GB RAM.

### Which model is best for coding?
DeepSeek Coder V2 6.7B or Qwen 2.5 Coder 7B.

### Can I use multiple models?
Yes! Download several models and switch between them with `--model`:
```bash
y7-ai --model phi3:mini "quick question"
y7-ai --model llama3.1:8b "complex task"
```

### How do I delete a model?
```bash
y7-models remove <model-name>
# or
ollama rm <model-name>
```

---

## Performance

### Why is it slow?
Running AI on CPU is slower than GPU. Tips to improve speed:
1. Use a smaller model (TinyLlama, Phi-3 Mini)
2. Close other applications
3. Ensure ZRAM is enabled: `systemctl status zramswap`

### How can I make it faster?
- GPU support (coming in v0.3.0)
- Use quantized models (Q4, Q5)
- Add more RAM
- Use SSD instead of HDD

### It's using all my RAM!
That's normal. LLMs need lots of memory. ZRAM helps by compressing RAM. If you're running out, use a smaller model.

---

## Troubleshooting

### y7-ai says "no model found"
```bash
# Check if Ollama is running
systemctl status ollama

# Start Ollama
sudo systemctl start ollama

# Download a model
y7-models download phi3:mini
```

### Open WebUI won't start
```bash
# Check Docker
docker ps

# Restart the container
docker restart open-webui

# Check logs
docker logs open-webui
```

### First boot never completes
```bash
# Check internet
ping google.com

# Check first-boot log
journalctl -u y7-first-boot

# Run manually
sudo /usr/local/bin/y7-first-boot
```

### WiFi doesn't work
```bash
# Check if detected
nmcli device

# Connect manually
nmtui
```

---

## Security

### Is my data safe?
Yes. All processing happens locally. No data is sent to external servers.

### Should I use this for sensitive work?
Y7 OS is designed for local, private AI. However:
- Use encrypted storage for sensitive data
- Keep the system updated
- Be cautious with models from unknown sources

### Are the AI models safe?
We only include models from trusted sources (Ollama library, Hugging Face). However, AI models can produce unexpected outputs — always review generated content.

---

## Contributing

### How can I help?
See [CONTRIBUTING.md](../../CONTRIBUTING.md). We need:
- Testers (especially on different hardware)
- Documentation writers
- Developers
- Translators

### How do I report a bug?
[GitHub Issues](https://github.com/yahyasaqban-lab/y7os/issues)

### Can I add my own tools?
Yes! Create a script in `/usr/local/bin/` starting with `y7-`. Submit a PR to include it in the next release.

---

## Comparison

### Y7 OS vs regular Linux + Ollama?
Y7 OS saves hours of setup:
- Pre-configured Ollama, Open WebUI, Docker
- Optimized for low RAM (ZRAM, swap)
- 94+ AI tools ready to use
- Works out of the box

### Y7 OS vs cloud AI (ChatGPT, Claude)?
| Aspect | Y7 OS | Cloud AI |
|--------|-------|----------|
| Cost | Free | $20/month+ |
| Privacy | 100% local | Data sent to cloud |
| Internet | Offline after setup | Always required |
| Speed | Depends on hardware | Fast |
| Models | Open source | Proprietary |

### Y7 OS vs other AI distros?
Y7 OS focuses on:
- Minimum viable hardware (4GB RAM)
- Arabic language support
- CLI-first design
- Simplicity over features

---

*More questions? [Ask on GitHub Discussions](https://github.com/yahyasaqban-lab/y7os/discussions)*
