# Y7 OS Changelog

## v0.3.0 — Solid AI Distro (May 18, 2026)

### New Infrastructure
- y7-web systemd service: Dashboard auto-starts on boot
- Watchdog timer: Auto-restarts crashed services every 60s
- First-boot service: Auto-downloads models based on RAM
- MOTD: Terminal greeting with live system status
- Docker Compose stack: Open WebUI + optional ChromaDB
- y7-driver tool: GPU detection + driver installer
- opt/y7/ directory with scripts + systemd configs

### Improved
- Installer enables all systemd services automatically
- Self-healing: watchdog restarts anything that crashes
- First-time UX: models download automatically on first boot
- Makefile includes all 13 tools

---

## v0.2.0 — Light Mode + New Tools (May 18, 2026)
...
