.PHONY: run
CONFIGS := ../../configs

define HELP
make setup
make clean
make run
make stop
endef

help:
	@: $(info $(HELP))

setup:
	mkdir -p run
	cp -R $(CONFIGS)/oxidized-file run/oxidized-config
	cp -R $(CONFIGS)/nginx run/
	cp -R $(CONFIGS)/lighttpd run/

clean:
	-$(MAKE) stop
	rm -rf run/

run:
	-$(MAKE) stop
	podman-compose up

stop:
	podman-compose down
	-rm run/oxidized-config/pid

