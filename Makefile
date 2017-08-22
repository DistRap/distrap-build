OSNAME :=$(shell grep -o '^NAME=.*$$' /etc/os-release | cut -d'=' -f2 )
ifeq ($(OSNAME),NixOS)
       STACK=stack --nix
else
       STACK=stack
endif

all: schema
	$(STACK) build

install: all
	$(STACK) install

clean: $(CLEANS)
	$(STACK) clean
	make -C ivory-tower-canopen/schema/ clean

# This target bootstraps Cidl
.PHONY: cidl-bootstrap
cidl-bootstrap:
	cd cidl; $(STACK) install

schema: cidl-bootstrap
	make -C ivory-tower-canopen/schema/
