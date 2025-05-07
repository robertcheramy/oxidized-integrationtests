# This image tests the installation on Fedora
# As Fedora is Cutting-edge, we always use latest
FROM docker.io/fedora:latest

RUN dnf -y update \
    && dnf -y install \
        # minimal init system
        dumb-init \
        # Packages from official installation instructions
        ruby ruby-devel \
        sqlite-devel \
        openssl-devel \
        pkgconf-pkg-config \
        cmake \
        libssh2-devel \
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
