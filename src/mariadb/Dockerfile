# Base image
FROM codjix/aio:latest

# Image inputs
ARG VARIANT="mariadb"
ARG VERSION=10.11.11

# Image info
LABEL org.opencontainers.image.title="AIO - ${VARIANT}" \
    org.opencontainers.image.description="All In One server, Docker images based on Alpine Linux." \
    org.opencontainers.image.author="Ibrahim Megahed <codjix@gmail.com>" \
    org.opencontainers.image.version="${VERSION}"

# Image config
ENV MARIADB_ROOT_PASSWORD=mariadb
EXPOSE 3306

# Image entrypoint
WORKDIR /app-ci/sh
COPY ./src/${VARIANT}/entrypoint.sh ${VARIANT}.sh

# Image setup
WORKDIR /app-ci/pkgs
RUN apk fetch --no-cache -R -o . mariadb && \
    # Image group and user
    addgroup -g 70 -S mysql && \
    adduser -u 70 -S -D -G mysql -H -h /var/lib/mysql -s /bin/sh mysql && \
    # Make the entrypoint executable
    chmod +x /app-ci/sh/${VARIANT}.sh

WORKDIR /app-ci

ENTRYPOINT [ "/app-ci/sh/mariadb.sh" ]