#!/bin/bash

# Extract the hostname from DATABASE_URL and set it as DB_HOST
if [ -n "$DATABASE_URL" ]; then
    DB_HOST=$(echo "$DATABASE_URL" | sed -n 's/.*\/\/\([^@]*\).*/\1/p')
    export DB_HOST
fi

# Start the Panel application
php artisan serve --host=0.0.0.0 --port=8080
