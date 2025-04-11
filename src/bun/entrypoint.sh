#!/bin/sh

if [ -f /app-ci/bun.tar.xz ]; then
  tar xf /app-ci/bun.tar.xz -C $BUN_INSTALL_BIN
  ln -s $BUN_INSTALL_BIN/bun $BUN_INSTALL_BIN/bunx
  rm -rf /app-ci/bun.tar.xz
fi

if [ "${1#-}" != "${1}" ] || [ -z "$(command -v "${1}")" ] || { [ -f "${1}" ] && ! [ -x "${1}" ]; }; then
  set -- bun repl
fi

exec "$@"