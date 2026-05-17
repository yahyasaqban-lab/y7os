#!/bin/bash
set -euo pipefail
VERSION="0.2.0"; LOG="/var/log/y7-asahi-install.log"; HOME_DIR="/opt/y7"
R='\033[0;31m'; G='\033[0;32m'; Y='\033[1;33m'; B='\033[0;34m'; C='\033[0;36m'; W='\033[1m'; N='\033[0m'
msg(){ echo -e "${G}[y7-asahi]${N} $1"; }
warn(){ echo -e "${Y}[y7-asahi]${N} $1"; }
err(){ echo -e "${R}[y7-asahi]${N} $1"; exit 1; }
log(){ echo "[$(date +'%Y-%m-%d %H:%M:%S')] $*" >> "$LOG"; }

check(){
  msg "Checking..."
  local a=$(uname -m); [[ "$a" == "aarch64" ]] || err "Need ARM64. Got: $a"
  msg "arch: aarch64 OK"; grep -qi "Apple" /proc/cpuinfo 2>/dev/null || warn "Not Apple Silicon?"
  local r=$(free -g | awk 'NR==2{print$2}'); [[ $r -ge 4 ]] || err "Need 4GB RAM. Got: ${r}GB"
  msg "RAM: ${r}GB OK"; [[ $EUID -eq 0 ]] || err "Need root: sudo $0"
}

deps(){
  msg "Installing deps..."
  if command -v dnf &>/dev/null; then dnf install -y curl wget git python3 python3-pip make gcc >> "$LOG" 2>&1
  elif command -v apt &>/dev/null; then apt-get update && apt-get install -y curl wget git python3 python3-pip build-essential >> "$LOG" 2>&1
  else err "No pkg manager (dnf/apt)"; fi; msg "Deps OK"
}

ollama_install(){
  msg "Installing Ollama + Metal GPU..."
  command -v ollama &>/dev/null && { msg "Ollama exists"; return; }
  curl -fsSL https://ollama.ai/install.sh | sh >> "$LOG" 2>&1
  sleep 2; systemctl enable ollama 2>/dev/null || true
  systemctl start ollama 2>/dev/null || ollama serve &>/dev/null &
  sleep 3; curl -s --max-time 5 http://localhost:11434 &>/dev/null && msg "Ollama + Metal OK" || warn "Ollama not responding"
}

docker_install(){
  msg "Installing Docker ARM64..."
  command -v docker &>/dev/null && { msg "Docker exists"; return; }
  if command -v dnf &>/dev/null; then dnf install -y docker docker-compose >> "$LOG" 2>&1; systemctl enable --now docker
  else apt-get install -y docker.io docker-compose-v2 >> "$LOG" 2>&1; systemctl enable --now docker; fi; msg "Docker OK"
}

webui(){
  msg "Installing Open WebUI..."
  docker ps --format '{{.Names}}' 2>/dev/null | grep -q "open-webui" && { msg "Open WebUI running"; return; }
  mkdir -p "$HOME_DIR"
  docker pull ghcr.io/open-webui/open-webui:latest >> "$LOG" 2>&1
  docker run -d --name open-webui -p 3000:8080 --restart unless-stopped -v open-webui-data:/app/backend/data ghcr.io/open-webui/open-webui:latest >> "$LOG" 2>&1
  msg "Open WebUI at http://localhost:3000"
}

models(){
  msg "Downloading Apple Silicon models..."
  for m in "phi4:mini" "gemma3:2b"; do
    ollama list 2>/dev/null | grep -q "$m" && msg "  ok $m" || { msg "  pulling $m..."; ollama pull "$m" 2>&1 | tail -1; }
  done
  local r=$(free -g | awk 'NR==2{print$2}'); [[ $r -ge 16 ]] && { msg "16GB+ pulling mistral:7b"; ollama pull "mistral:7b-q4_k_m" 2>&1 | tail -1 || true; }
}

tools(){
  msg "Installing Y7 CLI..."
  mkdir -p "$HOME_DIR/bin"; local u="https://raw.githubusercontent.com/yahyasaqban-lab/y7os/main/tools"
  for t in y7-ai y7-code y7-models y7-status y7-doctor y7-voice y7-web; do
    curl -fsSL "$u/$t" -o "$HOME_DIR/bin/$t" >> "$LOG" 2>&1; chmod +x "$HOME_DIR/bin/$t"
    ln -sf "$HOME_DIR/bin/$t" "/usr/local/bin/$t"; msg "  $t"
  done
}

tune(){
  msg "Optimizing for Apple Silicon..."
  local r=$(free -g | awk 'NR==2{print$2}')
  [[ $r -lt 8 ]] && { modprobe zram; echo 3G > /sys/block/zram0/disksize; mkswap /dev/zram0; swapon /dev/zram0; msg "  ZRAM 3GB"; }
  mkdir -p /etc/systemd/system/ollama.service.d/
  printf '[Service]\nEnvironment="OLLAMA_NUM_PARALLEL=2"\nEnvironment="OLLAMA_KEEP_ALIVE=5m"\n' > /etc/systemd/system/ollama.service.d/override.conf
  systemctl daemon-reload; systemctl restart ollama 2>/dev/null || true
  printf "vm.swappiness=10\nvm.vfs_cache_pressure=50\n" > /etc/sysctl.d/99-y7.conf; sysctl --system &>/dev/null || true
  msg "  Metal + memory tuning OK"
}

main(){
  echo -e "${B}══════════════════════════════${N}"
  echo -e "${G}  Y7 OS Asahi v${VERSION}${N}"
  echo -e "${B}══════════════════════════════${N}"
  rm -f "$LOG"; log "=== Y7 Asahi v${VERSION} ==="
  check; deps; ollama_install; docker_install; webui; models; tools; tune
  echo -e "${G}Done!${N} Web: http://localhost:3000 | Dashboard: http://localhost:9090"
  echo "Commands: y7-ai, y7-code, y7-models, y7-web, y7-status"
  log "=== Done ==="
}
main "$@"
