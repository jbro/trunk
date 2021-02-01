.PHONY: nop
nop:

packages-want = neovim git
include packages.mk

include symlink.mk

.PHONY: install
install: ~/.config/nvim->

~/.config/nvim->: vim

vim: | packages-install
	@git clone git@github.com:jbro/vim.git

.PHONY: update
update:
	@cd vim && git pull
