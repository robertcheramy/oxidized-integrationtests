# oxidized-integrationtests
Integration tests for oxidized

## Debian + nginx
Tests:
- default debian install: http://localhost:8001/
- nginx good reverse proxy: http://localhost:8002/
- nginx bad proxy configuration: http://localhost:8003/
  - produces a "Host not permited", see Issue https://github.com/ytti/oxidized/issues/3340
- lighttpd proxy: http://localhost:8004/
