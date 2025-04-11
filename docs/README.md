# AIO Documentation

This documentation provides detailed information about all the container images available in the AIO project.

## Container Images

- [Base (latest)](./latest.md) - Core Alpine image that serves as the base for all other images
- [Bun](./bun.md) - Bun JavaScript runtime environment
- [MariaDB](./mariadb.md) - MariaDB database server
- [Node.js](./node.md) - Node.js JavaScript runtime
- [PostgreSQL](./pg.md) - PostgreSQL database server
- [PHP](./php.md) - PHP with Apache web server

## Common Usage

All containers follow a similar pattern for usage:

```bash
docker run -d --name aio-container codjix/aio:<variant>
```

Refer to each container's specific documentation for detailed usage instructions and configuration options.