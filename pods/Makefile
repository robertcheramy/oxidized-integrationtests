POD_DIRS := $(wildcard */)
PODS := $(POD_DIRS:%/=%)

define HELP
Run one pod:
1. make <podname>.setup
2. make <podname>.run
3. make <podname>.stop
4. make <podname>.clean

Run all pods at a time:
1. make setup
2. make -j run
3. make stop
4. make cleanendef
endef

help:
	@: $(info $(HELP))


$(PODS:%=%.setup):
	$(MAKE) -C $(basename $@) setup

$(PODS:%=%.run):
	$(MAKE) -C $(basename $@) run

$(PODS:%=%.stop):
	$(MAKE) -C $(basename $@) stop

$(PODS:%=%.clean):
	$(MAKE) -C $(basename $@) clean

setup: $(PODS:%=%.setup)

run: $(PODS:%=%.run)

stop: $(PODS:%=%.stop)

clean: $(PODS:%=%.clean)
