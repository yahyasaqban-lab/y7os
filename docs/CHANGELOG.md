# Y7 OS Changelog

## v0.3.0 (WIP) — Live-Friendly Edition

### 🎯 New
- **Persistence support**: USB persistence partition auto-detection
- **Dual boot menu**: boot with or without persistence
- **Safe Mode**: nomodeset fallback for troubleshooting
- **Desktop guide**: persistence setup instructions on desktop
- **Pre-download model script**: faster first boot experience

### 🛠 Improved
- ISO includes `live-config`, `live-tools` packages
- POST /api/pull timeout increased for model downloads
- `root` user disabled (`y7` user with sudo)

### 📦 Removed
- Legacy ISO build artifacts

---

## v0.2.6 — Debian Native Build (May 11, 2026)

### 🎯 New
- First boot: Ollama + model auto-download
- Open WebUI on first boot (Docker pull)
- MOTD with welcome message and aliases
- `y7` user with passwordless sudo

### 🛠 Improved
- Switched to Debian bookworm container (native live-build)
- Cleaner GRUB menu
- Removed Ubuntu package mixing issues
- Disabled security repo (bookworm specific)

---

## v0.2.5 — Fixed Build Chain (May 10, 2026)

### 🛠 Fixed
- Removed invalid `--updates` option from lb config
- Force Debian mode to prevent Ubuntu package mixing
- Disable security repo to avoid 404 errors during build

---

## v0.1.0 — First Working Release

- y7-install works on Ubuntu/Debian
- y7-ai, y7-models, y7-status tools
- Ollama + Docker + Open WebUI setup
- ZRAM auto-configuration
- Arabic language support (--lang ar)
