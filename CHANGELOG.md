# CHANGELOG

## version 25.4.25

- `fix` orgnized docker files and added better comments
- `update` make mariadb use "mariadb" as a default root password
- `update` combined entrypoint scripts to use recursive method

## version 25.4.13

- `new` redis docker image

**Full Changelog**: https://github.com/codjix/aio/compare/v25.4.12...v25.4.13

## version 25.4.12

- `new` full project rewrite with a new architecture
- `new` core latest docker image
- `new` bun.sh runtime docker image
- `new` postgres database server docker image
- `update` nodejs runtime docker image
- `update` mariadb database server docker image
- `new` php 83 with extensions docker image
- `delete` web, old latest docker images

**Full Changelog**: https://github.com/codjix/aio/compare/v2.3.0...v25.4.12

## version 24.7.6

- `new` update alpine from 3.18 to 3.20
- `new` using openrc softlevel as process manager
- `remove` python supervisor to reduce image size and remove unwanted python pkgs
- `new` making image much more smaller by just fetching pkgs during docker build and keep them compressed and install them at first run
- `remove` extra unwanted configs
- `new` image data directory `/app` for logs, pid files and configs

**Full Changelog**: https://github.com/Hima-Pro/aio-server/compare/stable...v2.3.0

## version 23.11.6

**Full Changelog**: https://github.com/Hima-Pro/aio-server/commits/stable
