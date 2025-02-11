FROM docker.io/debian:bookworm

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        dumb-init lighttpd \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# RUN ls -l /etc/lighttpd/lighttpd.conf && cat /etc/lighttpd/lighttpd.conf

RUN sed -i 's/server\.port\s*=\s*80/server.port = 8004/' /etc/lighttpd/lighttpd.conf

# RUN ls -l /etc/lighttpd/lighttpd.conf && cat /etc/lighttpd/lighttpd.conf

EXPOSE 8004

ENTRYPOINT ["/usr/bin/dumb-init", "--"]

CMD ["lighttpd", "-D", "-f", "/etc/lighttpd/lighttpd.conf"]
