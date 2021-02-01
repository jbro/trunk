.PHONY: nop
nop:

packages-want = emacs aspell aspell-da aspell-en aspell-uk
include packages.mk
include systemd.mk
include symlink.mk

.PHONY: install
install: languagetool packages-install ~/.emacs.d-> default.target.wants/emacs.service

~/.emacs.d->: emacs.d

emacs.d:
	@git clone git@github.com:jbro/emacs.d.git

.PHONY: languagetool
languagetool: version = 5.2
languagetool:
	@$(MAKE) -C $@ languagetool-install-$(version)

.PHONY: update
update:
	@cd emacs.d && git pull
