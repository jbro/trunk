.PHONY: nop
nop:

packages-want = git
include packages.mk

include symlink.mk

.PHONY: install
install: ~/.bashrc->

~/.bashrc->: bashrc/bashrc

bashrc/bashrc: bashrc

bashrc: | packages-install
	git clone https://github.com/jbro/bashrc

.PHONY: update
update:
	@cd bashrc && git pull
