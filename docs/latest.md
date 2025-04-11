# AIO Base Image (latest)

The `codjix/aio:latest` image serves as the foundation for all other AIO images. It is based on Alpine Linux 3.20 and includes minimal dependencies to provide a lightweight base for other services.

## Image Information

- **Base**: Alpine Linux 3.20
- **Architecture**: amd64, arm64
- **Size**: Minimal (Alpine-based)
- **Version**: 1.0.0

## Features

- Minimal Alpine Linux configuration
- Includes essential utilities (xz, su-exec)
- Multi-stage build for optimized image size
- Standardized entrypoint script

## Usage

This image is primarily used as a base for other AIO images, but you can also run it directly:

```bash
docker run -it --name aio-base codjix/aio:latest
```

## Environment Variables

No specific environment variables for the base image.

## Volumes

No predefined volumes for the base image.

## Extending the Image

You can use this image as a base for your own custom images:

```Dockerfile
FROM codjix/aio:latest

# Add your custom installations and configurations
RUN apk add --no-cache your-package

# Set your entrypoint or command
CMD ["your-command"]
```

## Docker Compose Example

```yaml
version: '3'

services:
  base:
    image: codjix/aio:latest
    container_name: aio-base
    command: sh -c "while true; do echo 'Container running'; sleep 3600; done"
```

## Source Code

The Dockerfile and associated scripts for this image are available in the `src/latest` directory of the AIO repository.