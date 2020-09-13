SHELL := /bin/bash

menu:
	@perl -ne 'printf("%10s: %s\n","$$1","$$2") if m{^([\w+-]+):[^#]+#\s(.+)$$}' Makefile

build: # Build letfn/container
	@echo
	docker build -t letfn/container .
	$(MAKE) test

push: # Push letfn/container
	docker push letfn/container

test: # Test letfn/container image
	drone exec --pipeline test

bash: # Run a bash shell with letfn/container
	docker run --rm -ti letfn/container bash
