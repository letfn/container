FROM letfn/container

WORKDIR /drone/src

RUN apk update

COPY plugin /plugin

ENTRYPOINT [ "/tini", "--", "/plugin" ]
