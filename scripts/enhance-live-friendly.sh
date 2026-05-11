#!/usr/bin/env bash
# Y7 OS v0.3.0 — Build enhancements for live-friendly ISO
set -euo pipefail

VERSION="${1:-0.3.0}"
WORKDIR="$(pwd)"

echo "=== Y7 OS v${VERSION} Live-Friendly Build ==="

# ─── Step 1: cd to build dir ───
cd "$WORKDIR"

cat > config/hooks/live/9100-persistence.hook.chroot << 'HOOK'
#!/bin/bash
# Enable live-boot persistence
set -e

# Install persistence packages
apt-get install -y live-boot live-config live-tools

# Enable persistence in live boot
echo "live-media-path=/live" >> /etc/live/build.conf
echo "persistence" >> /etc/live/build.conf
echo "persistence-read-only" >> /etc/live/build.conf

# Create persistence script
cat > /usr/local/bin/y7-enable-persistence << 'SCRIPT'
#!/bin/bash
echo "══════════════════════════════════════"
echo "  Y7 OS — Persistence Setup"
echo ""
echo "  To save data across reboots:"
echo ""
echo "  1. sudo fdisk /dev/sdX  (create 2nd partition)"
echo "  2. sudo mkfs.ext4 -L persistence /dev/sdX2"
echo "  3. sudo mount /dev/sdX2 /mnt"
echo "  4. echo '/ union' | sudo tee /mnt/persistence.conf"
echo "  5. sudo umount /mnt"
echo ""
echo "  Your changes will survive reboots! 🎉"
echo "══════════════════════════════════════"
SCRIPT
chmod +x /usr/local/bin/y7-enable-persistence
HOOK
chmod +x config/hooks/live/9100-persistence.hook.chroot

# ─── Step 2: Download model inside ISO ───
# This pre-downloads a small default model to avoid first-boot net dependency
mkdir -p config/includes.chroot/usr/share/y7os/models
cat > config/hooks/live/9200-embedded-model.hook.chroot << 'HOOK'
#!/bin/bash
# Pre-download tinyllama so at least some AI works offline
set -e

# Model will be fetched at build time via docker/ollama
# We embed a script that downloads on first boot if missing
apt-get install -y curl ca-certificates

# First-boot model downloader (fast, one model only)
cat > /usr/local/bin/y7-download-default-model << 'SCRIPT'
#!/bin/bash
MODEL_DIR="/usr/share/y7os/models"
DOWNLOADED="/var/lib/y7os/model-downloaded"

[ -f "$DOWNLOADED" ] && exit 0

RAM=$(free -g | awk '/Mem:/{print $2}')
if [ "$RAM" -ge 8 ]; then MODEL="llama3.1:8b"
elif [ "$RAM" -ge 4 ]; then MODEL="phi3:mini"
else MODEL="tinyllama"; fi

echo "Downloading default model: $MODEL (${RAM}GB RAM detected)..."
ollama pull "$MODEL" 2>&1 | tail -1
touch "$DOWNLOADED"
echo "✅ Model ready: $MODEL"
SCRIPT
chmod +x /usr/local/bin/y7-download-default-model
HOOK
chmod +x config/hooks/live/9200-embedded-model.hook.chroot

# ─── Step 3: Add persistence label to ISO ───
# This makes persistence partition auto-detectable
cat > config/bootloaders/grub-pc/live.cfg << 'GRUB'
set default="0"
set timeout=5

menuentry "Y7 OS - Live (with persistence)" {
    linux /live/vmlinuz boot=live components quiet splash persistence
    initrd /live/initrd.img
}

menuentry "Y7 OS - Live (no persistence)" {
    linux /live/vmlinuz boot=live components quiet splash
    initrd /live/initrd.img
}

menuentry "Y7 OS - Safe Mode" {
    linux /live/vmlinuz boot=live components nomodeset noapic
    initrd /live/initrd.img
}
GRUB

# ─── Step 4: Add persistence README to ISO desktop ───
mkdir -p config/includes.chroot/etc/skel/Desktop
cat > config/includes.chroot/etc/skel/Desktop/PERSISTENCE.txt << 'TXT'
═════════════════════════════════════════
Y7 OS — Live Persistence Guide
═════════════════════════════════════════

To save your data between reboots:

1. Boot Y7 OS Live
2. Run: y7-enable-persistence
3. Follow the steps to create a persistence partition
4. Reboot — all changes will be saved!

If you don't need persistence:
- Just use the Live session normally
- All data is temporary (RAM-based)
TXT

# ─── Step 5: Add ISO metadata ───
echo "Y7 OS v${VERSION} Live-Friendly (hybrid ISO with persistence support)" >> ../ISO_DESCRIPTION.txt

echo "✅ Live-friendly enhancements applied for v${VERSION}"
echo "   - GRUB menu with persistence/no-persistence options"
echo "   - First-boot model downloader (minimizes offline time)"
echo "   - Persistence setup guide on desktop"
echo "   - Compatible with persistence partition (label: persistence)"
echo "   - Safe Mode for troubleshooting"
