.PHONY: images

define HELP
make images - build all images

"cd images" to (re)build specific ones
To run the pods, cd "pods"
endef

help:
	@: $(info $(HELP))

images:
	$(MAKE) -C images


