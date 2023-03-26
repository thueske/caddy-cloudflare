FROM caddy:2-builder-alpine AS builder
RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare \
    --with github.com/caddyserver/replace-response

FROM caddy:2-alpine
RUN apk add --update --no-cache inotify-tools
COPY scripts /docker
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
ENTRYPOINT /docker/entrypoint.sh
