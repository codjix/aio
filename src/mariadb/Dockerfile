FROM codjix/aio:latest

ARG VARIANT="mariadb"
ARG VERSION=10.11.11

# Image info
LABEL org.opencontainers.image.title="AIO - ${VARIANT}" \
    org.opencontainers.image.description="All In One server, Docker images based on Alpine Linux." \
    org.opencontainers.image.author="Ibrahim Megahed <codjix@gmail.com>" \
    org.opencontainers.image.version="${VERSION}"

WORKDIR /app-ci/sh
COPY ./src/${VARIANT}/entrypoint.sh ${VARIANT}.sh

# Image setup
WORKDIR /app-ci/pkgs
RUN apk update && apk fetch -R -o . mariadb pwgen
RUN chmod +x /app-ci/sh/${VARIANT}.sh && \
    addgroup -g 70 -S mysql && \
    adduser -u 70 -S -D -G mysql -H -h /var/lib/mysql -s /bin/sh mysql

ENV MARIADB_ROOT_PASSWORD=mariadb
EXPOSE 3306

ENTRYPOINT [ "/app-ci/entrypoint.sh", "/app-ci/sh/mariadb.sh" ]