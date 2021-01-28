MODULES = vim emacs bash languagetool systemd
export languagetool_version := 5.2

help:
	@echo Usage:
	@echo "    make install"
	@echo "    make update"


module-installs := $(MODULES:%=%/install)
install: $(module-installs)

$(module-installs):
	$(MAKE) -I ../include -C $(@D) install

module-update := $(MODULES:%=%/update)
update: $(module-update)

$(module-update):
	$(MAKE) -I ../include -C $(@D) update


.PHONY: install update help $(module-installs) $(module-update)
