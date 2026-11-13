# This image install custom gems into the latest official oxidized image
FROM docker.io/oxidized/oxidized:latest

WORKDIR /tmp/custom_gems
COPY custom_gems_data .
RUN set -e; for gem in *.gem; do [ -e "$gem" ] || continue; gem install "$gem"; done
WORKDIR /