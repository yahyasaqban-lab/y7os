# Contributing to Y7 OS

Thank you for your interest in Y7 OS! This guide will help you get started.

---

## Ways to Contribute

### 1. Testing & Bug Reports
The most valuable contribution is testing Y7 OS on different hardware:
- Download the ISO and try it on your machine
- Report issues with detailed hardware specs
- Test on old laptops, Raspberry Pi, VMs

**Report bugs:** [GitHub Issues](https://github.com/yahyasaqban-lab/y7os/issues)

### 2. Documentation
Help make Y7 OS accessible to everyone:
- Improve existing guides
- Write tutorials
- Translate to Arabic or other languages
- Create video tutorials

### 3. Code Contributions
- Fix bugs
- Add new y7-* tools
- Improve build scripts
- Package AI tools

### 4. Community Support
- Answer questions in Discussions
- Help users troubleshoot
- Share Y7 OS with others

---

## Development Setup

### Prerequisites
- Debian/Ubuntu Linux (or VM)
- 20GB+ free disk space
- `sudo` access

### Clone & Build

```bash
# Clone the repository
git clone https://github.com/yahyasaqban-lab/y7os.git
cd y7os

# Install build dependencies
sudo apt update
sudo apt install -y live-build debootstrap squashfs-tools xorriso \
    isolinux syslinux-efi grub-pc-bin grub-efi-amd64-bin mtools dosfstools

# Build the ISO (takes 30-60 minutes)
make build

# Or build manually
mkdir -p build && cd build
lb config --distribution bookworm ...
lb build
```

### Test in VM

```bash
# Using QEMU
qemu-system-x86_64 -m 4G -cdrom y7os-*.iso -boot d

# Using VirtualBox
VBoxManage createvm --name "Y7OS" --ostype Debian_64 --register
# ... configure and attach ISO
```

---

## Project Structure

```
y7os/
├── .github/workflows/    # CI/CD (build-iso.yml)
├── branding/             # Logo, icons, screenshots
├── docs/                 # Documentation
│   ├── guides/           # User guides
│   └── api/              # API reference
├── scripts/              # Build and utility scripts
│   └── installers/       # Tool installer scripts
├── tools/                # y7-* CLI tools
│   ├── y7-ai
│   ├── y7-models
│   └── y7-status
├── website/              # y7os.dev website
├── CONTRIBUTING.md       # This file
├── LICENSE               # MIT License
├── README.md             # Project overview
└── ROADMAP.md            # Development roadmap
```

---

## Coding Standards

### Shell Scripts (y7-* tools)
- Use `#!/bin/bash` shebang
- Use `set -e` for error handling
- Follow [Google Shell Style Guide](https://google.github.io/styleguide/shellguide.html)
- Add `--help` option to all tools
- Support `--lang ar` for Arabic output

### Commit Messages
```
type: short description

Longer explanation if needed.

Types: feat, fix, docs, style, refactor, test, chore
```

Examples:
```
feat: add y7-bench benchmarking tool
fix: correct RAM detection in y7-models recommend
docs: add Arabic translation for getting-started guide
```

### Pull Request Process
1. Fork the repository
2. Create a feature branch: `git checkout -b feat/my-feature`
3. Make your changes
4. Test locally (build ISO, run in VM)
5. Submit PR with clear description
6. Address review feedback

---

## Adding a New Tool

### 1. Create the tool script

```bash
# tools/y7-newtool
#!/bin/bash
set -e

VERSION="1.0.0"
LANG="${Y7_LANG:-en}"

show_help() {
    if [ "$LANG" = "ar" ]; then
        echo "أداة جديدة - وصف"
    else
        echo "New Tool - description"
    fi
}

# ... implementation
```

### 2. Add to build workflow

Edit `.github/workflows/build-iso.yml`:
```yaml
cp ../tools/y7-newtool config/includes.chroot/usr/local/bin/
```

### 3. Document the tool

Add to `docs/guides/cli-reference.md` and `docs/TOOLS.md`.

### 4. Submit PR

---

## Testing Checklist

Before submitting a PR, verify:

- [ ] ISO builds successfully (`make build`)
- [ ] Boot works in QEMU/VirtualBox
- [ ] Login works (y7/y7)
- [ ] y7-ai starts and responds
- [ ] y7-models list works
- [ ] y7-status shows system info
- [ ] Open WebUI accessible at localhost:3000
- [ ] Arabic mode works (`y7-ai --lang ar`)

---

## Getting Help

- **Questions:** [GitHub Discussions](https://github.com/yahyasaqban-lab/y7os/discussions)
- **Bugs:** [GitHub Issues](https://github.com/yahyasaqban-lab/y7os/issues)
- **Chat:** Coming soon (Discord/Matrix)

---

## Code of Conduct

- Be respectful and inclusive
- Help newcomers
- Focus on constructive feedback
- No harassment or discrimination

---

## License

By contributing, you agree that your contributions will be licensed under the MIT License.

---

*Y7 OS — AI for everyone*
