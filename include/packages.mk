##
# Usage:
# packages-want = git unzip
# include packages.mk
# target: packages-insall

.SECONDEXPANSION:

.PHONY: nop
nop:

export packages_import_count += 1
ifeq ($(packages_import_count), 1)
_packages_clean_up = .packages_clean_up
endif

.PHONY: .packages_clean_up
.packages_clean_up:
	@rm -f "${trunk}/.packages-cache-update"

${trunk}/.packages-cache-update: 
	@sudo apt-get update
	@touch $@

_packages_have = $(shell dpkg-query -W -f '$${Package}\n')
_packages_missing = $(filter-out $(_packages_have),$(packages-want))
ifneq ($(_packages_missing),)
_packages_apt-install = .packages_apt-install
endif

.PHONY: .packages_apt-install
.packages_apt-install: $(trunk)/.packages-cache-update
	@sudo apt-get install -y $(_packages_missing)

.PHONY: packages-install
packages-install: $(_packages_apt-install) $(_packages_clean_up)

