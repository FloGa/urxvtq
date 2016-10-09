PREFIX=/usr/local

SOURCES = $(wildcard src/*)
TARGETS = $(SOURCES:src/%=target/%)

target/%: src/%
	mkdir -p target
	sed "s|%%PREFIX%%|$(PREFIX)|" $< >$@

PHONY += default
default: build

PHONY += build
build: $(TARGETS)

PHONY += clean
clean:
	$(RM) -r target

PHONY += install
install: build
	install -Dm 0755 -t $(PREFIX)/bin target/urxvtq
	install -Dm 0755 -t $(PREFIX)/lib/urxvtq target/bash
	install -Dm 0644 -t $(PREFIX)/lib/urxvtq target/screenrc

PHONY += uninstall
uninstall:
	$(RM) $(PREFIX)/bin/urxvtq
	$(RM) -r $(PREFIX)/lib/urxvtq

.PHONY: $(PHONY)
