DOCKERFILES := $(wildcard *.Dockerfile)
IMAGES := $(DOCKERFILES:%.Dockerfile=%)

images: $(IMAGES)

$(IMAGES):
	podman image exists $@ || podman build -t oit/$@ -f $@.Dockerfile

$(IMAGES:%=%.rebuild):
	podman build -t oit/$(basename $@) -f $(basename $@).Dockerfile

clean:
	$(foreach image, $(IMAGES), podman rmi oit/$(image) || true;)

$(IMAGES:%=%.clean):
	podman rmi oit/$(basename $@)
