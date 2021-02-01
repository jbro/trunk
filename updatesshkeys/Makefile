.PHONY: nop
nop:

include systemd.mk

.PHONY: install
install: default.target.wants/updatesshkeys.service timers.target.wants/updatesshkeys.timer

.PHONY: update
update:
