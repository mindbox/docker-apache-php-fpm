# Apache PHP-FPM Docker Setup

This repository contains a Docker setup for running Apache with PHP-FPM. It includes configuration files for Apache, PHP, and PHP-FPM, as well as a GitHub Actions workflow for building and pushing Docker images.

## Project Structure

- `docker/`
  - `start.sh`: Script to start PHP-FPM and Apache.
  - `www.conf`: Configuration file for PHP-FPM.
  - `php.ini`: Configuration file for PHP.
  - `apache2.conf`: Configuration file for Apache.
  - `Dockerfile`: Dockerfile to build the Apache PHP-FPM image.
- `.github/workflows/`
  - `build.yml`: GitHub Actions workflow for checking updates and building Docker images.

## Usage

### Building the Docker Image

To build the Docker image, run the following command:

```sh
docker build -t your-image-name:tag docker/
```

### Running the Container

To run the container, use the following command:

```sh
docker run -d -p 80:80 your-image-name:tag
```

### GitHub Actions Workflow

The GitHub Actions workflow is set up to check for updates to the PHP version daily and build new Docker images if an update is found. It supports PHP versions 8.0 to 8.4.

## Configuration

### PHP Configuration

The PHP configuration is located in `docker/php.ini`. Key settings include:

- Error handling
- Memory and performance settings
- OPCache settings
- Session handling
- Security and uploads
- Logging and debugging

### PHP-FPM Configuration

The PHP-FPM configuration is located in `docker/www.conf`. Key settings include:

- User and group settings
- Socket settings
- Process management
- Logging and error handling
- Environment settings

### Apache Configuration

The Apache configuration is located in `docker/apache2.conf`. Key settings include:

- Performance optimization
- User and group settings
- Logging
- Security settings
- Performance tuning for static content
- MPM-Event optimization for containers
- PHP-FPM integration via Unix socket
- **Custom Configuration Files**: You can include additional custom configuration files by placing them in the `conf-enabled` or `conf.d` directories. These files will be included automatically.

## Contributing

Contributions are welcome! Please open an issue or submit a pull request.

## Contact

For any questions or issues, please open an issue on this repository.
