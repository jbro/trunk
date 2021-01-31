##
# Usage:
# include symlink.mk
# symlink;target-file: source-file 
#

.PHONY: nop
nop:

.PHONY: %!
%!:
	@$(trunk)/include/mksymlink.sh "$(@:%!=%)" "$(CURDIR)/$<" "$(trunk)/attic"
