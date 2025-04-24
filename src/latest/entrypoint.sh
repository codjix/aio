#!/bin/sh

# Prepare software
if [ -d /app-ci/pkgs ]; then
  echo "Installing packages..."
  apk add --no-network /app-ci/pkgs/*.apk > /dev/null
  echo "Done."
  rm -rf /app-ci/pkgs
fi

# Run current
if [ $# -eq 0 ]; then
  sh
fi

# Run next
exec "$@"