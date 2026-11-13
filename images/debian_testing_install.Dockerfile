# This image tests the installation on Debian testing (the rolling "testing"
# suite - currently forky, but this tag always follows whatever is next in line).
# Redundant with the current codename file on purpose: it keeps testing the
# upcoming release even after forky is promoted to stable.
# It is not optimized to be compact, it's just to test if the instructions work
FROM docker.io/debian:testing

RUN apt-get update \
    && apt-get install -y \
        # minimal init system
        dumb-init \
        # Packages from official installation instructions
        ruby ruby-dev libsqlite3-dev libssl-dev pkg-config cmake libssh2-1-dev \
        libicu-dev zlib1g-dev g++ libyaml-dev libzstd-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN gem install oxidized

RUN gem install oxidized-web

EXPOSE 8888

ENTRYPOINT ["/usr/bin/dumb-init", "--"]

CMD ["oxidized"]
