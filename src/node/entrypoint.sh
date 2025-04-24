#!/bin/sh

. /app-ci/entrypoint.sh echo ""

# Run current
if [ $# -eq 0 ]; then
  node
fi

# Run next
exec "$@"