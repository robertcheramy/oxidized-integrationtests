# This image tests the installation on Rocky Linux 10 "Red Quarz"
FROM docker.io/rockylinux/rockylinux:10

RUN dnf -y update \
    # Enable EPEL (for dumb-init) and CRB (for development headers and libssh2)
    && dnf -y install epel-release \
    && dnf config-manager --set-enabled crb \
    && dnf -y install \
        # minimal init system
        dumb-init \
        # Packages from official installation instructions
        ruby ruby-devel \
        sqlite-devel \
        openssl-devel \
        pkgconf-pkg-config \
        cmake \
        libssh-devel \
        libicu-devel \
        zlib-devel \
        gcc-c++ \
        libyaml-devel \
        which \
    && dnf clean all

RUN gem install oxidized

RUN gem install oxidized-web

EXPOSE 8888

ENTRYPOINT ["/usr/bin/dumb-init", "--"]

CMD ["oxidized"]
