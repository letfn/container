FROM ubuntu:bionic-20200112 AS download

RUN apt-get update && apt-get install -y curl

WORKDIR /tmp

RUN set -x; curl -sSL -O https://github.com/drone/drone-cli/releases/download/v1.2.1/drone_linux_amd64.tar.gz \
  && tar xvfz drone_linux_amd64.tar.gz \
  && rm -f drone_linux_amd64.tar.gz \
  && chmod 755 drone \
  && mv drone /usr/local/bin/

FROM ubuntu:bionic-20200112

WORKDIR /drone/src

RUN apt-get update && apt-get upgrade -y

COPY --from=download /usr/local/bin/drone /usr/local/bin/drone

COPY plugin /plugin

ENTRYPOINT [ "/plugin" ]
