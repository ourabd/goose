FROM alpine:3.18 AS base

ENV LANG=C.UTF-8 \
    DEBIAN_FRONTEND=noninteractive

RUN apk update && \
    apk add --no-cache \
    ca-certificates \
    curl && \
    rm -rf /var/cache/apk/*

RUN curl -fsSL https://raw.githubusercontent.com/pressly/goose/master/install.sh | sh

FROM alpine:3.18

WORKDIR /app

COPY --from=base /usr/local/bin/goose /app/goose

ENTRYPOINT [ "/app/goose" ]
