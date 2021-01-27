.PHONY: bashrc

bashrc:
ifneq ($(realpath $(wildcard ~/.bashrc)),$(CURDIR)/bashrc)
	-@mv ~/.bashrc ~/.bashrc-$(shell date +%s) 
	@ln -s $(CURDIR)/bashrc ~/.bashrc
endif
