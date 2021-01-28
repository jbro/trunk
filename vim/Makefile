include packages.mk
packages-want := neovim git

install: nvim-link

nvim-link: vim
ifneq ($(realpath $(wildcard ~/.config/nvim)),$(CURDIR)/vim)
	-@mv ~/.config/nvim ~/.config/nvim-$(shell date +%s)
	@ln -s $(CURDIR)/vim ~/.config/nvim
endif

vim: | packages-install
	git clone https://github.com/jbro/vim

.PHONY: nvim-link install
