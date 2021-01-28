.PHONY: unpack packages bash emacs languagetool systemd

## Unpack the trunk into homedir
unpack: packages bash emacs languagetool systemd

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

## Put ~/.bashrc in place
bash:
	$(MAKE) -C bash

## Put ~/.emacs.d in place
emacs:
	$(MAKE) -C emacs

## Put ~/.config/systemd in place and enable and start services
systemd:
	$(MAKE) -C systemd

## Fetch and unzip LanguageTool
languagetool_version := 5.2
export languagetool_version
languagetool:
	$(MAKE) -C languagetool

