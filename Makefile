PREFIX ?= $(HOME)/.local
BINDIR ?= $(PREFIX)/bin

.PHONY: install uninstall check

install:
	install -Dm755 shairport-tui "$(BINDIR)/shairport-tui"

uninstall:
	rm -f "$(BINDIR)/shairport-tui"

check:
	python3 -m py_compile shairport-tui
	./shairport-tui --help >/dev/null
