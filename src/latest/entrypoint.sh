#!/bin/sh

# 1. Install packages
if [ -d /app-ci/pkgs ]; then
  apk add --no-network /app-ci/pkgs/*.apk
  rm -rf /app-ci/pkgs
fi

if [ "${1#-}" != "${1}" ] || [ -z "$(command -v "${1}")" ] || { [ -f "${1}" ] && ! [ -x "${1}" ]; }; then
  set -- sh
fi

# 2. Excute $@
exec "$@"