FROM alpine:3.20

ARG VARIANT="latest"
ARG VERSION=1.0.0

# Image info
LABEL org.opencontainers.image.title="AIO - ${VARIANT}" \
    org.opencontainers.image.description="All In One server, Docker images based on Alpine Linux." \
    org.opencontainers.image.author="Ibrahim Megahed <codjix@gmail.com>" \
    org.opencontainers.image.version="${VERSION}"

# Image setup
WORKDIR /app-ci
COPY ./src/latest/entrypoint.sh ./entrypoint.sh
RUN apk add --no-cache xz su-exec && \
    chmod +x /app-ci/entrypoint.sh

ENTRYPOINT ["/app-ci/entrypoint.sh"]