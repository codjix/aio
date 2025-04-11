# AIO MariaDB Image

The `codjix/aio:mariadb` image provides a lightweight MariaDB database server built on Alpine Linux. This image is designed for both development and production environments.

## Image Information

- **Base**: codjix/aio:latest (Alpine 3.20)
- **Architecture**: amd64, arm64
- **Current Version**: 10.11.11

## Features

- MariaDB 10.11.11 database server
- Automatic initialization and database creation(soon)
- Password generation for root user if not specified
- Optimized for minimal footprint
- Persistent data storage

## Usage

### Basic Usage

```bash
# Run MariaDB server with default settings
docker run -d --name aio-mariadb -p 3306:3306 codjix/aio:mariadb
```

### Custom Root Password

```bash
docker run -d --name aio-mariadb -p 3306:3306 -e MARIADB_ROOT_PASSWORD=mysecretpassword codjix/aio:mariadb
```

### Data Persistence

```bash
docker run -d --name aio-mariadb \
  -p 3306:3306 \
  -v mariadb_data:/var/lib/mysql \
  -e MARIADB_ROOT_PASSWORD=mysecretpassword \
  codjix/aio:mariadb
```

## Environment Variables

- `MARIADB_ROOT_PASSWORD`: Root user password (default: randomly generated and saved to `/app-ci/mysql-root-pw.txt`)

## Volumes

- `/var/lib/mysql`: Database files storage

## Ports

- `3306`: MariaDB server port

## Connecting to the Database

### From Another Container

```bash
docker run -it --rm --link aio-mariadb:db codjix/aio:mariadb mariadb -h db -u root -p
```

### From Host Machine

```bash
mariadb -h 127.0.0.1 -P 3306 -u root -p
```

## Docker Compose Example

```yaml
version: '3'

services:
  mariadb:
    image: codjix/aio:mariadb
    container_name: aio-mariadb
    ports:
      - "3306:3306"
    volumes:
      - mariadb_data:/var/lib/mysql
    environment:
      - MARIADB_ROOT_PASSWORD=mysecretpassword
    restart: unless-stopped

volumes:
  mariadb_data:
```

## Source Code

The Dockerfile and associated scripts for this image are available in the `src/mariadb` directory of the AIO repository.