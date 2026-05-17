# Y7 OS — Makefile
# github.com/yahyasaqban-lab/y7os

.PHONY: install uninstall test clean help

TOOLS = y7-ai y7-models y7-status
PREFIX ?= /usr/local/bin

help:
	@echo ""
	@echo "  Y7 OS — AI Stack for Linux"
	@echo ""
	@echo "  make install    Install Y7 tools to $(PREFIX)"
	@echo "  make uninstall  Remove Y7 tools"
	@echo "  make test       Run installer dry-run"
	@echo "  make lint       Check scripts with shellcheck"
	@echo "  make clean      Remove temp files"
	@echo ""

install:
	@echo "Installing Y7 tools..."
	@for tool in $(TOOLS); do \
		sudo cp tools/$$tool $(PREFIX)/$$tool && \
		sudo chmod +x $(PREFIX)/$$tool && \
		echo "  Installed: $$tool"; \
	done
	@echo "Done. Run 'y7-status' to check."

uninstall:
	@echo "Removing Y7 tools..."
	@for tool in $(TOOLS); do \
		sudo rm -f $(PREFIX)/$$tool && \
		echo "  Removed: $$tool"; \
	done
	@echo "Done."

test:
	@echo "Testing y7-status..."
	@bash tools/y7-status
	@echo ""
	@echo "Testing y7-models help..."
	@bash tools/y7-models help
	@echo ""
	@echo "Testing y7-ai --help..."
	@bash tools/y7-ai --help

lint:
	@echo "Checking scripts with shellcheck..."
	@command -v shellcheck >/dev/null || { echo "Install shellcheck: apt install shellcheck"; exit 1; }
	@echo "  Checking tools/y7-*..."
	@shellcheck -x tools/y7-*
	@echo "  Checking scripts/*.sh..."
	@shellcheck -x scripts/*.sh 2>/dev/null || true
	@echo "  Checking tools/test-*.sh..."
	@shellcheck -x tools/test-*.sh 2>/dev/null || true
	@echo "All checks passed!"

clean:
	@rm -f *.tmp *.log
	@echo "Cleaned."
