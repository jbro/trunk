.PHONY: bashrc-link

bashrc-link: bashrc
ifneq ($(realpath $(wildcard ~/.bashrc)),$(CURDIR)/bashrc/bashrc)
	-@mv ~/.bashrc ~/.bashrc-$(shell date +%s) 
	@ln -s $(CURDIR)/bashrc/bashrc ~/.bashrc
endif

bashrc: 
	git clone https://github.com/jbro/bashrc


