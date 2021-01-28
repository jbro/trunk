##
# Set packages-want to a list of packages in a module
# to have those packages automagically installed
#
# eg:
# packages-want := git unzip

## Install packages-want if missing
packages-install: have := $(shell dpkg-query -W -f '$${Package}\n')
packages-install: missing = $(filter-out $(have),$(packages-want))
packages-install:
	@test -n '$(missing)' \
		&& sudo apt-get update \
		&& sudo apt-get install -y $(missing) \
		|| true

.PHONY: packages-install
