FROM caddy:builder AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare \
    --with github.com/RussellLuo/caddy-ext/ratelimit

FROM caddy

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
