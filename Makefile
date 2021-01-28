MODULES = vim emacs bash languagetool systemd
languagetool_version := 5.2

install: $(MODULES)

export languagetool_version
$(MODULES):
	$(MAKE) -I ../include -C $@

.PHONY: install $(MODULES)
