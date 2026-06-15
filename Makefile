PREFIX ?= $(HOME)/.local
BINDIR ?= $(PREFIX)/bin
MANDIR ?= $(PREFIX)/share/man
BASH_COMPLETION_DIR ?= $(PREFIX)/share/bash-completion/completions
ZSH_COMPLETION_DIR ?= $(PREFIX)/share/zsh/site-functions

.PHONY: install uninstall check

install:
	install -Dm755 shairport-tui "$(BINDIR)/shairport-tui"
	install -Dm644 docs/shairport-tui.1 "$(MANDIR)/man1/shairport-tui.1"
	install -Dm644 completions/shairport-tui.bash "$(BASH_COMPLETION_DIR)/shairport-tui"
	install -Dm644 completions/_shairport-tui "$(ZSH_COMPLETION_DIR)/_shairport-tui"

uninstall:
	rm -f "$(BINDIR)/shairport-tui"
	rm -f "$(MANDIR)/man1/shairport-tui.1"
	rm -f "$(BASH_COMPLETION_DIR)/shairport-tui"
	rm -f "$(ZSH_COMPLETION_DIR)/_shairport-tui"

check:
	python3 -m py_compile shairport-tui
	./shairport-tui --help >/dev/null
	./shairport-tui --version >/dev/null
