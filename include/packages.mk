##
# Set packages-want to a list of packages in a module
# to have those packages automagically installed
#
# eg:
# packages-want := git unzip

## Install packages-want if missing
packages-install: have := $(shell dpkg-query -W -f '$${Package}\n')
packages-install: missing = $(filter-out $(have),$(packages-want))
packages-install: $(trunk_dir)/.aptupdate.stamp
	@test -n '$(missing)' \
		&& sudo apt-get install -y $(missing) \
		|| true

#		&& sudo apt-get update \

$(trunk_dir)/.aptupdate.stamp:
	touch $@
	sudo apt-get update

.PHONY: packages-install
