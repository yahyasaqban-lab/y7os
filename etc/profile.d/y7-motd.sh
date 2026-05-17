#!/bin/bash
RAM=$(free -h | awk '/^Mem:/{print$3"/"$2}')
DISK=$(df -h / | awk 'NR==2{print$3"/"$2}')
UP=$(uptime -p | sed 's/up //')
O="❌"; D="❌"
curl -s --max-time 1 http://localhost:11434 &>/dev/null && O="✅"
docker ps --format '{{.Names}}' 2>/dev/null | grep -q "y7-open-webui" && D="✅"
cat <<MOTD

  🐉 Y7 OS v0.3.0 — AI Linux
  RAM: $RAM | Disk: $DISK | Up: $UP
  Ollama: $O | WebUI: $D
  Commands: y7-ai, y7-code, y7-web, y7-models
  Web UI: http://localhost:3000

MOTD
