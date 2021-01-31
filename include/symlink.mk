##
# Usage:
# include symlink.mk
# symlinkname!: target

.PHONY: nop
nop:

.PHONY: %!
%!:
	@$(trunk)/include/mksymlink.sh "$(@:%!=%)" "$(CURDIR)/$<" "$(trunk)/attic"
