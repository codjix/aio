# AIO Node.js Image

The `codjix/aio:node` image provides a lightweight Node.js runtime environment built on Alpine Linux. This image is optimized for running JavaScript and TypeScript applications.

## Image Information

- **Base**: codjix/aio:latest (Alpine 3.20)
- **Architecture**: amd64, arm64
- **Current Version**: 21.7.3

## Features

- Node.js 21.7.3 runtime
- npm package manager included
- Non-root user `node` with ID 1000 for better security
- Optimized for minimal footprint

## Usage

### Basic Usage

```bash
# Start a Node.js REPL
docker run -it --name aio-node codjix/aio:node

# Run a Node.js script
docker run -it --name aio-node -v $(pwd):/app -w /app codjix/aio:node node index.js
```

### Running a Web Application

```bash
docker run -d --name aio-node-app -v $(pwd):/app -w /app -p 3000:3000 codjix/aio:node node server.js
```

### Using with npm

```bash
# Install dependencies
docker run -it -v $(pwd):/app -w /app codjix/aio:node npm install

# Run npm scripts
docker run -it -v $(pwd):/app -w /app codjix/aio:node npm run start
```

## Volumes

Mount your application code to any directory, commonly `/app`:

```bash
docker run -it -v $(pwd):/app -w /app codjix/aio:node
```

## Docker Compose Example

```yaml
version: '3'

services:
  node-app:
    image: codjix/aio:node
    container_name: aio-node-app
    ports:
      - "3000:3000"
    volumes:
      - ./app:/app
    working_dir: /app
    command: node server.js
    environment:
      - NODE_ENV=production
    restart: unless-stopped
```

## Development Setup with Live Reload

```yaml
version: '3'

services:
  node-dev:
    image: codjix/aio:node
    container_name: aio-node-dev
    ports:
      - "3000:3000"
    volumes:
      - ./app:/app
    working_dir: /app
    command: npm run dev
    environment:
      - NODE_ENV=development
```

## Source Code

The Dockerfile and associated scripts for this image are available in the `src/node` directory of the AIO repository.