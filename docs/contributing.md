# Contributing to Y7 OS

First off — thank you. Y7 OS is a small project with a big goal, and every contribution matters.

---

## Ways to Contribute

You don't need to be an expert Linux developer to help. Here's what we need:

### 🐛 Report Bugs
Found something broken? [Open an issue](https://github.com/yahyasaqban-lab/y7os/issues/new?template=bug_report.md) with:
- Your hardware (device, RAM, CPU)
- Your OS and version
- What you expected vs what happened
- Any error output

### 💡 Suggest Features
Have an idea? [Open a feature request](https://github.com/yahyasaqban-lab/y7os/issues/new?template=feature_request.md). We especially welcome ideas around:
- Arabic language improvements
- New hardware targets
- Model management improvements
- Performance optimizations

### 🔧 Fix Bugs / Add Features
1. Fork the repo
2. Create a branch: `git checkout -b fix/your-fix-name`
3. Make your changes
4. Test on real hardware if possible
5. Submit a pull request

### 🧪 Test on Hardware
We need testers on:
- Raspberry Pi 4 / Pi 5
- Old Intel laptops (4th–8th gen)
- AMD laptops
- VPS (DigitalOcean, Hetzner, etc.)
- ARM SBCs (Orange Pi, Rock Pi, etc.)

Run the installer and report what works and what doesn't.

### 📝 Improve Documentation
Docs live in `docs/`. If something is unclear, fix it. If something is missing, add it. Arabic translations especially welcome.

### 🌐 Arabic Localization
We want Y7 OS to be genuinely excellent in Arabic, not just translated. If you're a native Arabic speaker, help us with:
- UI string translations
- Arabic model testing and evaluation
- RTL layout issues
- Arabic documentation

---

## Development Setup

```bash
# Clone the repo
git clone https://github.com/yahyasaqban-lab/y7os
cd y7os

# Test the install script locally (on Linux)
chmod +x tools/y7-install
./tools/y7-install

# Test individual tools
chmod +x tools/y7-models tools/y7-status tools/y7-ai
./tools/y7-status
./tools/y7-models recommend
```

---

## Code Style

- Shell scripts: follow existing style, use `set -e`, add comments
- Keep it simple — Y7 OS targets intermediate users, not kernel hackers
- Every script should work on both x86_64 and ARM (aarch64)
- Test on low-RAM devices before submitting (or note if you couldn't)

---

## Pull Request Checklist

Before submitting a PR:

- [ ] Tested on at least one real Linux system
- [ ] Works with 4GB RAM (or noted if it requires more)
- [ ] No external dependencies added without discussion
- [ ] Comments added for non-obvious code
- [ ] Updated relevant docs if behavior changed

---

## First-Time Contributors

New to open source? Start with issues labeled [`good first issue`](https://github.com/yahyasaqban-lab/y7os/labels/good%20first%20issue). These are small, well-defined tasks that don't require deep knowledge of the codebase.

---

## Code of Conduct

Be kind. Be constructive. Y7 OS is built for people who are often excluded from tech — let's make sure our community doesn't exclude anyone either.

Harassment, discrimination, and bad-faith behavior will not be tolerated.

---

## Questions?

Open a [Discussion](https://github.com/yahyasaqban-lab/y7os/discussions) — we're happy to help.

---

*Thank you for helping make AI accessible to everyone.*
