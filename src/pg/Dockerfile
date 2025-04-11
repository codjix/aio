FROM codjix/aio:latest

ARG VARIANT="pg"
ARG VERSION=16.8.0

# Image info
LABEL org.opencontainers.image.title="AIO - ${VARIANT}" \
    org.opencontainers.image.description="All In One server, Docker images based on Alpine Linux." \
    org.opencontainers.image.author="Ibrahim Megahed <codjix@gmail.com>" \
    org.opencontainers.image.version="${VERSION}"

ENV PGHOME="/var/lib/postgresql"
ENV PGDATA="${PGHOME}/data"
ENV POSTGRES_USER="postgres"
ENV POSTGRES_PASSWORD="postgres"
ENV POSTGRES_DB="postgres"

WORKDIR /app-ci/sh
COPY ./src/${VARIANT}/entrypoint.sh ${VARIANT}.sh

# Image setup
WORKDIR /app-ci/pkgs
RUN apk update && apk fetch -R -o . postgresql16 && \
    chmod +x /app-ci/sh/${VARIANT}.sh && \
    addgroup -g 70 -S postgres && \
    adduser -u 70 -S -D -G postgres -H -h ${PGHOME} -s /bin/sh postgres

WORKDIR /app-ci
EXPOSE 5432

ENTRYPOINT [ "/app-ci/entrypoint.sh", "/app-ci/sh/pg.sh" ]