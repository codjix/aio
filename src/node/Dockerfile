# Base image
FROM codjix/aio:latest

# Image inputs
ARG VARIANT="node"
ARG VERSION=21.7.3

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
RUN apk fetch --no-cache -R -o . nodejs-current npm && \
  # Image group and user
  addgroup -g 1000 node && \
  adduser -u 1000 -G node -s /bin/sh -D node && \
  # Make the entrypoint executable
  chmod +x /app-ci/sh/${VARIANT}.sh

WORKDIR /app-ci

ENTRYPOINT [ "/app-ci/sh/node.sh" ]