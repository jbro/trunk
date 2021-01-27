services := $(wildcard services/*.service)
links := $(foreach s,$(services),~/.config/systemd/user/$(notdir $(s)))
enables := $(foreach s,$(services),~/.config/systemd/user/default.target.wants/$(notdir $(s)))

.PHONY: all

all: $(enables)

$(enables): $(wildcard ~/).config/systemd/user/default.target.wants/% : $(wildcard ~/).config/systemd/user/%
	systemctl --user enable $*
	systemctl --user start $*

$(links): $(wildcard ~/).config/systemd/user/% : services/%
	@mkdir -p ~/.config/systemd/user
	@ln -s $(CURDIR)/$< $@
	@systemctl --user daemon-reload
