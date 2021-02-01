.PHONY: nop
nop:

packages-want := default-jre-headless unzip wget
include packages.mk
include systemd.mk

.PHONY: languagetool-install-%
languagetool-install-%: LanguageTool-% default.target.wants/languagetool.service ;

.SECONDARY:
LanguageTool-%: | LanguageTool-%.zip
	unzip -o $|
	ln -sf $@ LanguageTool

.SECONDARY:
LanguageTool-%.zip: | packages-install
	@wget https://languagetool.org/download/$@

