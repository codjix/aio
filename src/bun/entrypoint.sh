#!/bin/sh

/app-ci/entrypoint.sh echo ""

# Prepare software
if [ -f /app-ci/bun.tar.xz ]; then
  tar xf /app-ci/bun.tar.xz -C $BUN_INSTALL_BIN
  ln -s $BUN_INSTALL_BIN/bun $BUN_INSTALL_BIN/bunx
  rm -rf /app-ci/bun.tar.xz
fi

# Run current
if [ $# -eq 0 ]; then
  bun repl
fi

# Run next
exec "$@"