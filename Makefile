MODULES = vim bash emacs
packages-want = ripgrep
.PHONY: help
help:
	@echo Usage:
	@echo "    make install"
	@echo "    make update"

export trunk = $(CURDIR)

include include/packages.mk
#include include/systemd.mk

.PHONY: $(module-installs)
module-installs := $(MODULES:%=%/install)
$(module-installs):
	@$(MAKE) -I ../include -C $(@D) install

.PHONY: install
install: $(module-installs) packages-install

.PHONY: $(module-update)
module-update := $(MODULES:%=%/update)
$(module-update):
	@$(MAKE) -I ../include -C $(@D) update

.PHONY: update
update: $(module-update)

