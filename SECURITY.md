# Security Policy

## Supported Versions

| Version | Supported          |
| ------- | ------------------ |
| 0.3.x   | :white_check_mark: |
| 0.2.x   | :white_check_mark: |
| < 0.2   | :x:                |

## Reporting a Vulnerability

We take security seriously. If you discover a security vulnerability in Y7 OS, please report it responsibly.

### How to Report

1. **DO NOT** open a public GitHub issue for security vulnerabilities
2. Email: **security@y7os.dev** (or yahyasaqban@gmail.com if security@ is unavailable)
3. Include:
   - Description of the vulnerability
   - Steps to reproduce
   - Potential impact
   - Suggested fix (if any)

### What to Expect

- **Acknowledgment:** Within 48 hours
- **Initial Assessment:** Within 7 days
- **Resolution Timeline:** Depends on severity
  - Critical: 24-72 hours
  - High: 1-2 weeks
  - Medium: 2-4 weeks
  - Low: Next release cycle

### Scope

In scope:
- `y7-install` installer script
- `y7-*` CLI tools
- ISO build process
- Default configurations

Out of scope:
- Third-party software (Ollama, Docker, Open WebUI) — report to upstream
- Social engineering attacks
- Denial of service attacks

### Recognition

We appreciate responsible disclosure and will:
- Credit you in the release notes (unless you prefer anonymity)
- Add you to our security acknowledgments

## Security Best Practices

When using Y7 OS:

1. **Keep Updated:** Run `y7-update` regularly
2. **Firewall:** Y7 OS binds services to localhost by default; be careful exposing ports
3. **Models:** Only download models from trusted sources (Ollama library, Hugging Face)
4. **API Keys:** Never commit API keys; use environment variables

## Hardening Guide

For production deployments:

```bash
# Disable root SSH (if enabled)
sudo sed -i 's/PermitRootLogin yes/PermitRootLogin no/' /etc/ssh/sshd_config

# Enable automatic security updates
sudo apt install unattended-upgrades
sudo dpkg-reconfigure -plow unattended-upgrades

# Restrict Docker socket permissions
sudo chmod 660 /var/run/docker.sock
```

---

*Last updated: May 2026*
