.PHONY: nop
nop:

packages-want = emacs aspell aspell-da aspell-en aspell-uk
include packages.mk

include symlink.mk

.PHONY: install
install: ~/.emacs.d!

~/.emacs.d!: emacs.d

