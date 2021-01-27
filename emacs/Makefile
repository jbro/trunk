.PHONY: emacsd

emacsd:
ifneq ($(realpath $(wildcard ~/.emacs.d)),$(CURDIR)/emacs.d)
	-@mv ~/.emacs.d ~/.emacs.d-$(shell date +%s) 
	@ln -s $(CURDIR)/emacs.d ~/.emacs.d
endif
