SBINDIR	= /usr/sbin
SVCDIR	= /lib/systemd/system

SCRIPT	= taupunkt
SVCFILE	= ventilation.service

install:
	echo "Installing $(SBINDIR)/$(SCRIPT)"
	@install -m 555 $(SCRIPT) $(SBINDIR)
	@if ! cmp -s $(SVCFILE) $(SVCDIR)/$(SVCFILE); then \
		echo "Installing $(SVCDIR)/$(SVCFILE)"; \
		install -m 444 $(SVCFILE) $(SVCDIR); \
	else \
		echo "Not installing $(SVCDIR)/$(SVCFILE); unchanged"; \
	fi

.PHONY: patches
patches:
	rm -rf patches
	git format-patch -o patches origin/master
