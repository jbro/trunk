include packages.mk
packages-want := emacs aspell aspell-da aspell-en aspell-uk

install: emacsd-link packages-install

emacsd-link:
ifneq ($(realpath $(wildcard ~/.emacs.d)),$(CURDIR)/emacs.d)
	-@mv ~/.emacs.d ~/.emacs.d-$(shell date +%s)
	@ln -s $(CURDIR)/emacs.d ~/.emacs.d
endif

.PHONY: emacsd-link install
