##
# Set packages-want to a list of packages in a module
# to have those packages automagically installed
#
# eg:
# packages-want := git unzip

.PHONY: nop
nop:

export packages_import_count += 1

.PHONY: packages-install
packages-install: have = $(shell dpkg-query -W -f '$${Package}\n')
packages-install: missing = $(filter-out $(have),$(packages-want))
packages-install: ${trunk}/.packages-cache-update
	@sudo apt-get install -y $(missing)
ifeq ($(packages_import_count), 1)
	@rm -f "$<"
endif

${trunk}/.packages-cache-update: 
	@sudo apt-get update
	@touch $@

