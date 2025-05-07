# This image tests the installation on Fedora
# As Fedora is Cutting-edge, we always use latest
FROM docker.io/rockylinux:9.3

RUN dnf -y update \
    # Enable EPEL and CRB (for development headers and libssh2)
    && dnf -y install epel-release \
    && dnf config-manager --set-enabled crb \
    # You need ruby 3.1 to run oxidized
    && dnf -y module enable ruby:3.1 \
    && dnf -y install \
        # minimal init system, not supported in rockylinux:9.3
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
