# This image install custom gems into the latest official oxidized image
FROM docker.io/oxidized/oxidized:latest

WORKDIR /tmp/custom_gems
COPY custom_gems_data .
RUN gem install *.gem
WORKDIR /