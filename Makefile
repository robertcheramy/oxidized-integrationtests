
help:
	@: $(info $(HELP))

######## Images
images: image_debian_install image_linuxgeneric image_lighttpd

image_debian_install:
	podman build -t oit/debian_install -f images/debian_install.Dockerfile

image_linuxgeneric:
	podman build -t oit/linuxgeneric -f images/linuxgeneric.Dockerfile

image_lighttpd:
	podman build -t oit/lighttpd -f images/lighttpd.Dockerfile

images_debian-install: image_debian_install image_linuxgeneric image_lighttpd

######## Setup
setup_debian-install:
	mkdir -p debian-install/run/
	cp -R configs/oxidized-file debian-install/run/oxidized-config
	cp -R configs/nginx debian-install/run/
	cp -R configs/lighttpd debian-install/run/


######## Clean
clean: clean_debian-install

clean_debian-install:
	-$(MAKE) stop_debian-install
	-podman rmi oit/debian_install
	-podman rmi oit/linuxgeneric
	rm -rf debian-install/run/

######## Run
run_debian-install:
	podman-compose -f debian-install/debian-install.yml up

######## Stop
stop_debian-install:
	podman-compose -f debian-install/debian-install.yml down


######## all inclusive image build
all: all_debian-install

all_debian-install:
	-$(MAKE) clean_debian-install
	$(MAKE) images_debian-install
	$(MAKE) setup_debian-install
	$(MAKE) run_debian-install

######## light: no clean, no image build
light_debian-install:
	-$(MAKE) stop_debian-install
	-rm debian-install/run/oxidized-config/pid
	$(MAKE) setup_debian-install
	$(MAKE) run_debian-install



define HELP
Look into Makefile to know the targets...
make all will build all images and run all integration tests at a time.
Be sure to have enought ressources for this...
endef
