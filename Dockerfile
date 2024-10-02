# Dockerfile
# Use the PHP 8.2 alpine official image
# https://hub.docker.com/_/php
FROM php:8.2-alpine

# Create and change to the app directory.
WORKDIR /app

# Copy local code to the container image.
COPY . ./

# Install project dependencies
RUN composer install --ignore-platform-reqs

CMD ["php", "artisan serve", "--host", "::"]