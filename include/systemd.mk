##
# Usage:
# include systemd.mk
#
# To install system/%.service into default.target:
# default.target.wants/%.service:
#

.PHONY: nop
nop:

.PHONY: .systemd-enable_linger
.systemd-enable_linger: /var/lib/systemd/linger/$(USER)
/var/lib/systemd/linger/$(USER):
	@sudo loginctl enable-linger $(USER)

.PHONY: default.target.wants/%.service
default.target.wants/%.service: ~/.config/systemd/user/default.target.wants/%.service .systemd-enable_linger ;

.SECONDARY:
~/.config/systemd/user/default.target.wants/%.service: systemd/%.service
	@systemctl --user link $< \
		&& systemctl --user enable $(<F) \
		&& systemctl --user start $(<F)

