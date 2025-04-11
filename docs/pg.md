# AIO PostgreSQL Image

The `codjix/aio:pg` image provides a lightweight PostgreSQL database server built on Alpine Linux. This image is designed for both development and production environments.

## Image Information

- **Base**: codjix/aio:latest (Alpine 3.20)
- **Architecture**: amd64, arm64
- **Current Version**: 16.8.0

## Features

- PostgreSQL 16.8.0 database server
- Automatic initialization and database creation
- User and database creation on first run
- Optimized for minimal footprint
- Persistent data storage

## Usage

### Basic Usage

```bash
# Run PostgreSQL server with default settings
docker run -d --name aio-pg -p 5432:5432 codjix/aio:pg
```

### Custom User, Password, and Database

```bash
docker run -d --name aio-pg \
  -p 5432:5432 \
  -e POSTGRES_USER=myuser \
  -e POSTGRES_PASSWORD=mypassword \
  -e POSTGRES_DB=mydb \
  codjix/aio:pg
```

### Data Persistence

```bash
docker run -d --name aio-pg \
  -p 5432:5432 \
  -v pg_data:/var/lib/postgresql/data \
  -e POSTGRES_USER=myuser \
  -e POSTGRES_PASSWORD=mypassword \
  -e POSTGRES_DB=mydb \
  codjix/aio:pg
```

## Environment Variables

- `POSTGRES_USER`: Username for database access (default: postgres)
- `POSTGRES_PASSWORD`: Password for database access (default: postgres)
- `POSTGRES_DB`: Name of the default database (default: postgres)
- `PGDATA`: Location of the database files (default: /var/lib/postgresql/data)
- `PGHOME`: PostgreSQL home directory (default: /var/lib/postgresql)

## Volumes

- `/var/lib/postgresql/data`: Database files storage

## Ports

- `5432`: PostgreSQL server port

## Connecting to the Database

### From Another Container

```bash
docker run -it --rm --link aio-pg:db codjix/aio:pg psql -h db -U postgres
```

### From Host Machine

```bash
psql -h localhost -p 5432 -U postgres
```

## Docker Compose Example

```yaml
version: '3'

services:
  postgres:
    image: codjix/aio:pg
    container_name: aio-pg
    ports:
      - "5432:5432"
    volumes:
      - pg_data:/var/lib/postgresql/data
    environment:
      - POSTGRES_USER=myuser
      - POSTGRES_PASSWORD=mypassword
      - POSTGRES_DB=mydb
    restart: unless-stopped

volumes:
  pg_data:
```

## Source Code

The Dockerfile and associated scripts for this image are available in the `src/pg` directory of the AIO repository.