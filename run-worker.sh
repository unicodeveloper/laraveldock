#!/bin/bash

# Make sure this file has executable permissions, run `chmod +x run-worker.sh` to ensure it does

# Run the Queue worker
php artisan queue:work
