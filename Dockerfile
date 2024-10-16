FROM debian:bookworm-slim AS base

RUN apt-get update && \
    apt-get install -y curl && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

RUN curl -fsSL https://raw.githubusercontent.com/pressly/goose/master/install.sh | sh

FROM debian:bookworm-slim

WORKDIR /app

COPY --from=base /usr/local/bin/goose /app/goose

ENTRYPOINT [ "/app/goose" ]
