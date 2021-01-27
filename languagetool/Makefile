version := $(languagetool_version)

LanguageTool: LanguageTool-$(version)
	ln -sf LanguageTool-$(version) LanguageTool

LanguageTool-$(version): | LanguageTool-$(version).zip
	unzip -o LanguageTool-$(version).zip

LanguageTool-$(version).zip:
	wget https://languagetool.org/download/LanguageTool-$(version).zip
