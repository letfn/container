FROM ubuntu:bionic

WORKDIR /drone/src

RUN echo 1

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y figlet rsync curl make git

RUN curl -sSL -O https://github.com/drone/drone-cli/releases/download/v1.2.1/drone_linux_amd64.tar.gz \
  && tar xvfz drone_linux_amd64.tar.gz \
  && rm -f drone_linux_amd64.tar.gz \
  && chmod 755 drone \
  && mv drone /usr/local/bin/

COPY plugin /plugin

ENTRYPOINT [ "/plugin" ]
