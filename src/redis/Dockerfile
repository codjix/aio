FROM codjix/aio:latest

ARG VARIANT="redis"
ARG VERSION=7.2.7

# Image info
LABEL org.opencontainers.image.title="AIO - ${VARIANT}" \
    org.opencontainers.image.description="All In One server, Docker images based on Alpine Linux." \
    org.opencontainers.image.author="Ibrahim Megahed <codjix@gmail.com>" \
    org.opencontainers.image.version="${VERSION}"

WORKDIR /app-ci/sh
COPY ./src/${VARIANT}/entrypoint.sh ${VARIANT}.sh

# Image setup
WORKDIR /app-ci/pkgs
RUN apk fetch --no-cache -o . redis tzdata && \
    # Redis group and user
    addgroup -S -g 1000 redis && \
    adduser -S -G redis -u 999 redis && \
    mkdir -p /data && chown -R redis:redis /data && \
    # Entrypoint
    chmod +x /app-ci/sh/${VARIANT}.sh

WORKDIR /app-ci
EXPOSE 6379

ENTRYPOINT [ "/app-ci/entrypoint.sh", "/app-ci/sh/redis.sh" ]
