# oxidized-integrationtests
This repository contains integration tests for oxidized. It is primary
targetet for my own use, so the documentation is not very pretty. Feel free
to use it if you want, don't expect much support.

## Run
To run all tests in paralell, you could in theory just start `make run`. Note
that this may take some time and ressources AND it may not work.

You probably prefer to build images once (`make images` or rebuild images as
needed (`cd images; make debian_install.rebuild`), and run one pod at a time
(`cd pods/debian-install; make setup; make run`).

Don't forget to `make stop` after running your pod to clean the rights in the
filesystem (official-docker).

## debian-install
Debian as you would intall it from instructions, with an nginx  and a lighttpd
web-proxy.

### Tests
- default debian install: http://localhost:8001/
- nginx good reverse proxy: http://localhost:8002/
- nginx bad proxy configuration: http://localhost:8003/
  - produces a "Host not permited", see Issue https://github.com/ytti/oxidized/issues/3340
- lighttpd proxy: http://localhost:8004/

## official docker
Official docker container with the githubrepo hook.

### Git server public keys
To enable Oxidized to access the Git server, you'll need to retrieve the
servers' public SSH keys and store them under `oxidized-ssh/known_hosts`.
Without this, you will encounter the following error:

```
ERROR -- : Hook push_to_remote (#<GithubRepo:0x00007f4cff47d918>) failed (#<Rugged::SshError: invalid or unknown remote ssh hostkey>) for event :post_store
```

While the container environment is running (`make start`), open a separate shell
and run (from `pods/official-docker/`):
```
make gitserver-getkey
```

You don't need to restart the container environment; Oxidized will
automatically use the key the next time it pushes to the remote Git repository.

### Tests:
- oxidized container: http://localhost:8042/
