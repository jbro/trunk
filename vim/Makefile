.PHONY: nop
nop:

packages-want = neovim git
include packages.mk

include symlink.mk

.PHONY: install
install: ~/.config/nvim!

~/.config/nvim!: vim

vim: | packages-install
	git clone https://github.com/jbro/vim

