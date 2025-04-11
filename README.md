# All In One (AIO) Server

A collection of Docker images based on Alpine Linux designed for development and production environments.

## Overview

AIO provides lightweight, efficient Docker images for various server environments, all built on Alpine Linux for minimal footprint and maximum performance.

## Available Images

- **latest**: Core Alpine image that serves as the base for all other images
- **bun**: Bun JavaScript runtime environment
- **mariadb**: MariaDB database server
- **node**: Node.js JavaScript runtime
- **pg**: PostgreSQL database server
- **php**: PHP with Apache web server

## Features

- All images based on Alpine Linux for minimal size
- Cross-platform compatibility (supports both x64 and ARM64)
- Simplified configuration via environment variables
- Pre-configured with sensible defaults
- Consistent interface across different services

## Quick Start

```bash
# Pull the image you need
docker pull codjix/aio:php

# Run the container
docker run -d -p 80:80 -v $(pwd):/var/www/localhost/htdocs codjix/aio:php

# For database containers
docker run -d -p 3306:3306 -v mysql_data:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=securepassword codjix/aio:mariadb
```

## Docker Compose

Example docker-compose.yml for a PHP and MariaDB setup:

```yaml
version: '3'

services:
  web:
    image: codjix/aio:php
    ports:
      - "80:80"
    volumes:
      - ./www:/var/www/localhost/htdocs
    depends_on:
      - db

  db:
    image: codjix/aio:mariadb
    environment:
      MARIADB_ROOT_PASSWORD: securepassword
    volumes:
      - mariadb_data:/var/lib/mysql

volumes:
  mariadb_data:
```

## Documentation

For detailed information on each image, please see the [documentation](./docs/README.md).

## License

This project is licensed under the MIT License.
