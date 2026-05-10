# Troubleshooting / استكشاف الأخطاء

## Common Issues

### Ollama won't start
```bash
# Check if Ollama is running
systemctl status ollama

# Start manually
ollama serve

# Check logs
journalctl -u ollama -f
```

### "Not enough memory" when running models
Your RAM is too low for the selected model.

```bash
# Check free RAM
free -m

# Use a smaller model
y7-models recommend

# For <4GB RAM, use TinyLlama
ollama run tinyllama
```

### Docker permission denied
```bash
# Add your user to docker group
sudo usermod -aG docker $USER

# Log out and back in, or run
newgrp docker
```

### Open WebUI not accessible
```bash
# Check if container is running
docker ps | grep y7-webui

# Restart it
docker restart y7-webui

# Check logs
docker logs y7-webui
```

### Model download stuck
```bash
# Kill and retry
pkill ollama
ollama serve &
ollama pull phi3:mini
```

### ZRAM not working
```bash
# Check if zram module is loaded
lsmod | grep zram

# Load it manually
sudo modprobe zram

# Check if swap is active
swapon --show
```

---

## المشاكل الشائعة (عربي)

### Ollama لا يعمل
```bash
systemctl status ollama
ollama serve
```

### الذاكرة غير كافية
استخدم نموذج أصغر:
```bash
y7-models recommend
ollama run tinyllama
```

### صلاحيات Docker
```bash
sudo usermod -aG docker $USER
# ثم أعد تسجيل الدخول
```

---

## Getting Help

- GitHub Issues: https://github.com/yahyasaqban-lab/y7os/issues
- Check system status: `y7-status`
- Check Ollama: `ollama ps`
