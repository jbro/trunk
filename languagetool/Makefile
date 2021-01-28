include packages.mk
packages-want := default-jre unzip wget

install: LanguageTool

version := $(languagetool_version)
LanguageTool: LanguageTool-$(version)
	ln -sf LanguageTool-$(version) LanguageTool

LanguageTool-$(version): | LanguageTool-$(version).zip
	unzip -o LanguageTool-$(version).zip

LanguageTool-$(version).zip: | packages-install
	wget https://languagetool.org/download/LanguageTool-$(version).zip

.PHONY: install
