#STACK=stack
STACK=stack --nix

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
