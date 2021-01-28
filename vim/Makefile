.PHONY: nvim-link

nvim-link: vim
ifneq ($(realpath $(wildcard ~/.config/nvim)),$(CURDIR)/vim)
	-@mv ~/.config/nvim ~/.config/nvim-$(shell date +%s) 
	@ln -s $(CURDIR)/vim ~/.config/nvim
endif

vim: 
	git clone https://github.com/jbro/vim


