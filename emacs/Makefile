.PHONY: nop
nop:

packages-want = emacs aspell aspell-da aspell-en aspell-uk
include packages.mk
include systemd.mk
include symlink.mk

.PHONY: install
install: languagetool packages-install ~/.emacs.d! default.target.wants/emacs.service

~/.emacs.d!: emacs.d

.PHONY: languagetool
languagetool: version = 5.2
languagetool:
	$(MAKE) -C $@ languagetool-install-$(version)
