# Base image
FROM codjix/aio:latest

# Image inputs
ARG VARIANT="pg"
ARG VERSION=16.8.0

# Image info
LABEL org.opencontainers.image.title="AIO - ${VARIANT}" \
    org.opencontainers.image.description="All In One server, Docker images based on Alpine Linux." \
    org.opencontainers.image.author="Ibrahim Megahed <codjix@gmail.com>" \
    org.opencontainers.image.version="${VERSION}"

# Image config
ENV PGHOME="/var/lib/postgresql"
ENV PGDATA="${PGHOME}/data"
ENV POSTGRES_USER="postgres"
ENV POSTGRES_PASSWORD="postgres"
ENV POSTGRES_DB="postgres"

# Image entrypoint
WORKDIR /app-ci/sh
COPY ./src/${VARIANT}/entrypoint.sh ${VARIANT}.sh

# Image setup
WORKDIR /app-ci/pkgs
RUN apk fetch --no-cache -R -o . postgresql16 && \
    # Image group and user
    addgroup -g 70 -S postgres && \
    adduser -u 70 -S -D -G postgres -H -h ${PGHOME} -s /bin/sh postgres && \
    # Make the entrypoint executable
    chmod +x /app-ci/sh/${VARIANT}.sh

WORKDIR /app-ci
EXPOSE 5432

ENTRYPOINT [ "/app-ci/sh/pg.sh" ]