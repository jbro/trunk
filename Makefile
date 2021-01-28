MODULES = vim emacs bash languagetool systemd
.PHONY: unpack packages $(MODULES)
## Unpack the trunk into homedir
unpack: packages $(MODULES)

## Install  pkgs-want if missing
pkgs-want = git unzip \
	neovim \
	emacs aspell aspell-da aspell-en aspell-uk default-jre \
	ripgrep

pkgs-have := $(shell dpkg-query -W -f '$${Package}\n')
pkgs-missing := $(filter-out $(pkgs-have),$(pkgs-want))

packages:
ifneq ($(pkgs-missing),)
	sudo apt-get update
	sudo apt-get install -y $(pkgs-missing)
endif

languagetool_version := 5.2
export languagetool_version
$(MODULES):
	$(MAKE) -C $@

