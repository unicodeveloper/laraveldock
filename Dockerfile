# Dockerfile
# Use the PHP 8.2 alpine official image
# https://hub.docker.com/_/php
FROM php:8.2-alpine

RUN apt-get update -y && apt-get install -y libmcrypt-dev

# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Install other dependencies
RUN docker-php-ext-install pdo mbstring


# Create and change to the app directory.
WORKDIR /app

# Copy local code to the container image.
COPY . ./

# Install project dependencies
RUN composer install --ignore-platform-reqs

CMD ["php", "artisan serve", "--host", "::"]