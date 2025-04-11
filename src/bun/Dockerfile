FROM codjix/aio:latest

ARG VARIANT="bun"
ARG VERSION=1.2.9

# Image info
LABEL org.opencontainers.image.title="AIO - ${VARIANT}" \
  org.opencontainers.image.description="All In One server, Docker images based on Alpine Linux." \
  org.opencontainers.image.author="Ibrahim Megahed <codjix@gmail.com>" \
  org.opencontainers.image.version="${VERSION}"

# Disable the runtime transpiler cache by default inside Docker containers.
# On ephemeral containers, the cache is not useful
ARG BUN_RUNTIME_TRANSPILER_CACHE_PATH=0
ENV BUN_RUNTIME_TRANSPILER_CACHE_PATH=${BUN_RUNTIME_TRANSPILER_CACHE_PATH}

# Ensure `bun install -g` works
ARG BUN_INSTALL_BIN=/usr/local/bin
ENV BUN_INSTALL_BIN=${BUN_INSTALL_BIN}

WORKDIR /app-ci/sh
COPY ./src/${VARIANT}/entrypoint.sh ${VARIANT}.sh

# Image setup
WORKDIR /app-ci/pkgs
RUN apk update && apk fetch -R -o . libgcc libstdc++ && \
  chmod 777 /app-ci/sh/${VARIANT}.sh && \
  arch=$(uname -m) && \
  export ARCH=$([ "$(uname -m)" = "x86_64" ] && echo "x64" || echo "aarch64") && \
  wget https://github.com/oven-sh/bun/releases/download/bun-v${VERSION}/bun-linux-${ARCH}-musl.zip && \
  unzip bun-linux-${ARCH}-musl.zip && cd bun-linux-${ARCH}-musl && \
  tar cv bun | xz -f9 -T0 > /app-ci/bun.tar.xz && \
  cd .. && rm -rf bun-linux-*-musl* && \
  addgroup -g 1000 bun && \
  adduser -u 1000 -G bun -s /bin/sh -D Bun

WORKDIR /app-ci

ENTRYPOINT [ "/app-ci/entrypoint.sh", "/app-ci/sh/bun.sh" ]