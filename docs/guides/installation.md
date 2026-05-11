# Installation Guide

## Requirements

| Component | Minimum | Recommended |
|-----------|---------|-------------|
| RAM | 4 GB | 8 GB+ |
| Storage | 20 GB | 50 GB+ |
| CPU | 64-bit x86 | 4+ cores |
| Internet | Required for first boot | Optional after |

---

## Option 1: Live USB (Recommended)

### Download
Get the latest ISO from [GitHub Releases](https://github.com/yahyasaqban-lab/y7os/releases/latest)

### Flash to USB

**Linux/macOS:**
```bash
# Find your USB device
lsblk

# Flash (replace sdX with your device)
sudo dd if=y7os-0.2.6-amd64.iso of=/dev/sdX bs=4M status=progress
sync
```

**Windows:**
- Use [Balena Etcher](https://www.balena.io/etcher/) (recommended)
- Or [Rufus](https://rufus.ie/)

**Multi-boot:**
- Use [Ventoy](https://www.ventoy.net/) — just copy the ISO to the USB

### Boot
1. Insert USB and restart
2. Press F12/F2/Del (varies by manufacturer) for boot menu
3. Select USB device
4. Wait for Y7 OS to load

---

## Option 2: Virtual Machine

### VirtualBox

1. Download [VirtualBox](https://www.virtualbox.org/)
2. Create new VM:
   - Type: Linux
   - Version: Debian 64-bit
   - RAM: 4096 MB minimum
   - Disk: 20 GB
3. Settings → System → Enable EFI (optional)
4. Settings → Storage → Add ISO to optical drive
5. Start VM

### QEMU/KVM

```bash
# Install QEMU
sudo apt install qemu-system-x86

# Run Y7 OS
qemu-system-x86_64 \
  -m 4G \
  -smp 4 \
  -cdrom y7os-0.2.6-amd64.iso \
  -boot d \
  -enable-kvm
```

### UTM (macOS)

1. Download [UTM](https://mac.getutm.app/)
2. Create new VM → Emulate → Linux
3. Select Y7 OS ISO
4. Allocate 4+ GB RAM
5. Start

---

## Option 3: Install to Disk

> ⚠️ This will erase your disk. Backup first!

Y7 OS currently runs as a live system. Persistent installation coming in v0.3.0.

For now, you can:
1. Boot from USB
2. Use persistence mode (stores data on USB)

---

## First Boot

### Login
```
Username: y7
Password: y7
```

### What Happens Automatically
1. Network connects (DHCP)
2. Ollama installs (~500 MB download)
3. Open WebUI Docker image pulls (~1 GB)
4. AI model downloads based on your RAM:
   - 8GB+ → Llama 3.1 8B
   - 6GB → Qwen 2.5 7B
   - 4GB → Phi-3 Mini
   - <4GB → TinyLlama

This takes 5-15 minutes on first boot.

### Check Status
```bash
# See what's happening
y7-status

# Watch first-boot progress
journalctl -f -u y7-first-boot
```

---

## Troubleshooting

### Boot Issues

**Black screen after selecting USB:**
- Try disabling Secure Boot in BIOS
- Try legacy/CSM boot mode

**"No bootable device" error:**
- Re-flash the USB with a different tool
- Try a different USB port (USB 2.0 if USB 3.0 fails)

### Network Issues

**No internet connection:**
```bash
# Check network status
nmcli general status

# Connect to WiFi
nmcli device wifi connect "NetworkName" password "password"

# Or use NetworkManager TUI
nmtui
```

### First Boot Stuck

**Ollama not installing:**
```bash
# Check internet
ping -c1 google.com

# Manual install
curl -fsSL https://ollama.com/install.sh | sh

# Check logs
journalctl -u y7-first-boot
```

---

## Next Steps

After installation:
1. Run `y7-ai` to start chatting
2. Run `y7-models recommend` to see best model for your system
3. Open `http://localhost:3000` for web UI

See [Getting Started](getting-started.md) for more.
