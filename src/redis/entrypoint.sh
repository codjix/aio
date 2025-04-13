#!/bin/sh

if [ -n "$REDIS_PASSWORD" ]; then
  export REDIS_ARGS="--requirepass $REDIS_PASSWORD"
fi

if [ $# -eq 0 ]; then
  su-exec redis redis-server --save 60 1 --loglevel notice --dir /data $REDIS_ARGS
fi

exec "$@"
