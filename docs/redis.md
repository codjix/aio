# AIO Redis Image

The `codjix/aio:redis` image provides a lightweight Redis server built on Alpine Linux. This image is designed for both development and production environments.

## Image Information

- **Base**: codjix/aio:latest (Alpine 3.20)
- **Architecture**: amd64, arm64
- **Current Version**: 7.2.7

## Features

- Redis 7.2.7 server
- Configurable password authentication
- Automatic data persistence (save every 60 seconds if at least 1 key changes)
- Optimized for minimal footprint
- Persistent data storage

## Usage

### Basic Usage

```bash
# Run Redis server with default settings
docker run -d --name aio-redis -p 6379:6379 codjix/aio:redis
```

### With Password Authentication

```bash
docker run -d --name aio-redis \
  -p 6379:6379 \
  -e REDIS_PASSWORD=mysecretpassword \
  codjix/aio:redis
```

### Data Persistence

```bash
docker run -d --name aio-redis \
  -p 6379:6379 \
  -v redis_data:/data \
  -e REDIS_PASSWORD=mysecretpassword \
  codjix/aio:redis
```

## Environment Variables

- `REDIS_PASSWORD`: Optional password for Redis authentication

## Volumes

- `/data`: Redis data directory for persistence

## Ports

- `6379`: Redis server port

## Connecting to the Redis Server

### Without Password Authentication

```bash
docker run -it --rm codjix/aio:redis redis-cli -h redis
```

### With Password Authentication

```bash
docker run -it --rm codjix/aio:redis redis-cli -h redis -a mysecretpassword
```

### From Host Machine

```bash
redis-cli -h <container_ip> -p 6379
```

## Docker Compose Example

```yaml
version: '3'

services:
  redis:
    image: codjix/aio:redis
    container_name: aio-redis
    ports:
      - "6379:6379"
    volumes:
      - redis_data:/data
    environment:
      - REDIS_PASSWORD=mysecretpassword
    restart: unless-stopped

volumes:
  redis_data:
```

## Source Code

The Dockerfile and associated scripts for this image are available in the `src/redis` directory of the AIO repository.