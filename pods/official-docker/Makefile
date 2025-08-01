.PHONY: run
CONFIGS := ../../configs

define HELP
1. make setup
2. make run
3. make stop
4. make clean
endef

help:
	@: $(info $(HELP))

setup:
	mkdir -p run
	mkdir -p run/oxidized-ssh run/oxidized-config
	cp -R $(CONFIGS)/oxidized-gitserver/* run/oxidized-config/
	git init --bare run/repo.git;

clean:
	-$(MAKE) stop
	-$(MAKE) clean-rights
	rm -rf run/

rights:
	podman unshare chown -R 30000:30000 run/oxidized-config run/oxidized-ssh
	podman unshare chown -R 30001 run/repo.git

gitserver-getkey:
	podman exec --user oxidized -t official-docker_oxidized_1 sh -c "ssh-keyscan gitserver > /home/oxidized/.ssh/known_hosts"

clean-rights:
	podman unshare chown -R 0:0 run

run: rights
	podman-compose up

stop:
	podman-compose down
	$(MAKE) clean-rights

