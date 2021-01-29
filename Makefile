MODULES = vim emacs bash languagetool
export languagetool_version := 5.2
packages-want := ripgrep

help:
	@echo Usage:
	@echo "    make install"
	@echo "    make update"

export trunk_dir := $(CURDIR)

include include/systemd.mk
include include/packages.mk

module-installs := $(MODULES:%=%/install)
install: $(module-installs) systemd-enable_linger packages-install
$(module-installs):
	$(MAKE) -I ../include -C $(@D) install

module-update := $(MODULES:%=%/update)
update: $(module-update)
$(module-update):
	$(MAKE) -I ../include -C $(@D) update

.PHONY: install update help $(module-installs) $(module-update)
