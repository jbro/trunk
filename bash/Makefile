include packages.mk
packages-want := git

install: bashrc-link

bashrc-link: bashrc
ifneq ($(realpath $(wildcard ~/.bashrc)),$(CURDIR)/bashrc/bashrc)
	-@mv ~/.bashrc ~/.bashrc-$(shell date +%s)
	@ln -s $(CURDIR)/bashrc/bashrc ~/.bashrc
endif

bashrc: | packages-install
	git clone https://github.com/jbro/bashrc

.PHONY: bashrc-link install
