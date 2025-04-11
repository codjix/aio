# AIO PHP Image

The `codjix/aio:php` image provides a lightweight PHP environment with Apache web server built on Alpine Linux. This image is optimized for running PHP web applications and includes common PHP extensions.

## Image Information

- **Base**: codjix/aio:latest (Alpine 3.20)
- **Architecture**: amd64, arm64
- **Current Version**: 8.3.15

## Features

- PHP 8.3.15 with Apache 2
- Common PHP extensions pre-installed
- Automatic configuration of PHP and Apache settings
- Apache with mod_rewrite enabled
- Composer package manager

## Usage

### Basic Usage

```bash
# Run PHP server with mounted web directory
docker run -d --name aio-php -p 80:80 -v $(pwd):/var/www/localhost/htdocs codjix/aio:php
```

### Using PHP CLI

```bash
# Run PHP script
docker run -it --name aio-php -v $(pwd):/app -w /app codjix/aio:php php script.php
```

### Using Composer

```bash
# Install dependencies
docker run -it -v $(pwd):/app -w /app codjix/aio:php composer install
```

## Included PHP Extensions

- apache2
- curl
- gd
- mbstring
- sodium
- mysqli
- pdo_mysql
- sqlite3
- pdo_sqlite
- zip
- ctype
- session
- xml
- json
- iconv

## PHP Configuration

PHP is pre-configured with the following optimized settings:

- `max_file_uploads = 1024`
- `upload_max_filesize = 1024M`
- `post_max_size = 1024M`

Apache is configured with:
- mod_rewrite enabled
- AllowOverride set to All (for .htaccess support)

## Volumes

- `/var/www/localhost/htdocs`: Web root directory

## Ports

- `80`: Apache HTTP server port

## Docker Compose Example

### Simple PHP Website

```yaml
version: '3'

services:
  web:
    image: codjix/aio:php
    container_name: aio-php
    ports:
      - "80:80"
    volumes:
      - ./www:/var/www/localhost/htdocs
    restart: unless-stopped
```

### PHP Website with MariaDB

```yaml
version: '3'

services:
  web:
    image: codjix/aio:php
    container_name: aio-php
    ports:
      - "80:80"
    volumes:
      - ./www:/var/www/localhost/htdocs
    depends_on:
      - db
    restart: unless-stopped

  db:
    image: codjix/aio:mariadb
    container_name: aio-mariadb
    environment:
      - MARIADB_ROOT_PASSWORD=password
    volumes:
      - mariadb_data:/var/lib/mysql
    restart: unless-stopped

volumes:
  mariadb_data:
```

## Source Code

The Dockerfile and associated scripts for this image are available in the `src/php` directory of the AIO repository.