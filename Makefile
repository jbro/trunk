##
# TODO:
# - Make MODULES dependant on host name, or include seperate MODULE_$(HOSTNAME)
MODULES = vim bash emacs updatesshkeys
packages-want = ripgrep

.PHONY: help
help:
	@echo Usage:
	@echo "    make install"
	@echo "    make update"

export trunk = $(CURDIR)

include include/packages.mk

.PHONY: $(module-installs)
module-installs := $(MODULES:%=%/install)
$(module-installs):
	@$(MAKE) -I $(trunk)/include -C $(@D) install

.PHONY: install
install: $(module-installs) packages-install

.PHONY: $(module-update)
module-update := $(MODULES:%=%/update)
$(module-update):
	@git pull
	@$(MAKE) -I $(trunk)/include -C $(@D) update

.PHONY: update
update: $(module-update)

