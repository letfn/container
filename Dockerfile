FROM alpine:3.12.0

WORKDIR /app/src

USER root
RUN addgroup -g 1000 app
RUN adduser -u 1000 -G app -h /app/src -s /bin/bash -H -D app
RUN mkdir -p /app/src && chown -R app:app /app

RUN addgroup -g 1001 boot
RUN adduser -u 1001 -G boot -h /app/src -s /bin/bash -H -D boot

RUN apk add curl make rsync git tini bash
RUN apk update

RUN ln -nfs /bin/bash /bin/sh
RUN ln -nfs /sbin/tini /tini

COPY plugin /plugin

USER boot
ENV HOME=/app/src

ENTRYPOINT [ "/tini", "--", "/plugin" ]
