FROM debian:stable-slim

ARG SNELL_VERSION=4.0.1

RUN apt-get update \
    && apt-get install -y curl unzip \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

ARG TARGETPLATFORM

RUN case "${TARGETPLATFORM}" in \
        "linux/amd64")  ARCH="amd64" ;; \
        "linux/arm64")  ARCH="aarch64" ;; \
        "linux/arm/v7") ARCH="armv7l" ;; \
        "linux/386")    ARCH="i386" ;; \
    esac \
    && curl -L "https://dl.nssurge.com/snell/snell-server-v${SNELL_VERSION}-linux-$ARCH.zip" -o snell-server.zip \
    && unzip snell-server.zip \
    && chmod +x snell-server \
    && mv snell-server /usr/local/bin/ \
    && rm snell-server.zip

COPY entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh

EXPOSE 8182/tcp
EXPOSE 8182/udp

ENTRYPOINT ["entrypoint.sh"]
