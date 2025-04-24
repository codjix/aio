#!/bin/sh
set -e

/app-ci/entrypoint.sh echo ""

# Prepare software
if [ -n "$REDIS_PASSWORD" ]; then
  export REDIS_ARGS="--requirepass $REDIS_PASSWORD"
fi

# Run current
if [ $# -eq 0 ]; then
  su-exec redis redis-server --save 60 1 --loglevel notice --dir /data $REDIS_ARGS
fi

# Run next
exec "$@"
