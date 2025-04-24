# Base image
FROM codjix/aio:latest

# Image inputs
ARG VARIANT="php"
ARG VERSION=8.3.15

# Image info
LABEL org.opencontainers.image.title="AIO - ${VARIANT}" \
    org.opencontainers.image.description="All In One server, Docker images based on Alpine Linux." \
    org.opencontainers.image.author="Ibrahim Megahed <codjix@gmail.com>" \
    org.opencontainers.image.version="${VERSION}"

# Image entrypoint
WORKDIR /app-ci/sh
COPY ./src/${VARIANT}/entrypoint.sh ${VARIANT}.sh

# Image setup
WORKDIR /app-ci/pkgs
RUN apk fetch --no-cache -R -o . \
    # Main pkgs
    apache2 php83 composer \
    # PHP extensions
    php-apache2 php-curl php-gd php-mbstring php-sodium \
    php-mysqli php-pdo_mysql php-sqlite3 php-pdo_sqlite php-zip \
    php-ctype php-session php-xml php-json php-iconv && \
    # Make the entrypoint executable
    chmod +x /app-ci/sh/${VARIANT}.sh

WORKDIR /app-ci

ENTRYPOINT [ "/app-ci/sh/php.sh" ]