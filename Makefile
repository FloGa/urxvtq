DESTDIR=/usr/local

SOURCES = $(wildcard src/*)
TARGETS = $(SOURCES:src/%=target/%)

target/%: src/%
	mkdir -p target
	sed "s|%%DESTDIR%%|$(DESTDIR)|" $< >$@

PHONY += default
default: build

PHONY += build
build: $(TARGETS)

PHONY += clean
clean:
	$(RM) -r target

PHONY += install
install: build
	install -Dm 0755 -t $(DESTDIR)/bin target/urxvtq
	install -Dm 0755 -t $(DESTDIR)/lib/urxvtq target/bash
	install -Dm 0644 -t $(DESTDIR)/lib/urxvtq target/screenrc

PHONY += uninstall
uninstall:
	$(RM) $(DESTDIR)/bin/urxvtq
	$(RM) -r $(DESTDIR)/lib/urxvtq

.PHONY: $(PHONY)
