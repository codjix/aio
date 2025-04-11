# AIO Bun Image

The `codjix/aio:bun` image provides a lightweight container for running applications with the Bun JavaScript runtime. This image is built on top of the AIO base image and includes the Bun runtime environment.

## Image Information

- **Base**: codjix/aio:latest (Alpine 3.20)
- **Architecture**: amd64, arm64
- **Current Version**: 1.2.9

## Features

- Bun JavaScript runtime
- Preinstalled bunx command for package execution
- Optimized for minimal footprint
- User with ID 1000 for running Bun applications

## Usage

### Basic Usage

```bash
# Start a Bun REPL
docker run -it --name aio-bun codjix/aio:bun

# Run a Bun script
docker run -it --name aio-bun -v $(pwd):/app -w /app codjix/aio:bun bun run index.ts
```

### Running a Web Application

```bash
docker run -d --name aio-bun-app -v $(pwd):/app -w /app -p 3000:3000 codjix/aio:bun bun run index.ts
```

## Environment Variables

- `BUN_RUNTIME_TRANSPILER_CACHE_PATH`: Set to 0 by default to disable the runtime transpiler cache
- `BUN_INSTALL_BIN`: Path for global bun installs, defaults to /usr/local/bin

## Volumes

Mount your application code to any directory, commonly `/app`:

```bash
docker run -it -v $(pwd):/app -w /app codjix/aio:bun
```

## Working with Dependencies

To install and use dependencies with Bun:

```bash
# Install dependencies
docker run -it -v $(pwd):/app -w /app codjix/aio:bun bun install

# Run with dependencies
docker run -it -v $(pwd):/app -w /app codjix/aio:bun bun run start
```

## Docker Compose Example

```yaml
version: '3'

services:
  bun-app:
    image: codjix/aio:bun
    container_name: aio-bun-app
    ports:
      - "3000:3000"
    volumes:
      - ./app:/app
    working_dir: /app
    command: bun run index.ts
    environment:
      - NODE_ENV=development
      - BUN_RUNTIME_TRANSPILER_CACHE_PATH=0
```

## Source Code

The Dockerfile and associated scripts for this image are available in the `src/bun` directory of the AIO repository.