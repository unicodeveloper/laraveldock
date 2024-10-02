#!/bin/bash

# Make sure this file has executable permissions, run `chmod +x run-app.sh` to ensure it does

# Build assets using NPM
npm run build

# Clear cache
php artisan optimize:clear

# Cache the various components of the Laravel application
php artisan config:cache
php artisan event:cache
php artisan route:cache
php artisan view:cache

# Run any database migrations
php artisan migrate --force

# Run the app
php artisan serve --host ::