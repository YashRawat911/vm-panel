# Use the official mariadb image for the database service
FROM mariadb:10.5

# Set the working directory
WORKDIR /app

# Copy the entrypoint script into the container
COPY ./entrypoint.sh /entrypoint.sh

# Set the entrypoint script as executable
RUN chmod +x /entrypoint.sh

# Copy the database initialization script into the container
COPY ./init.sql /docker-entrypoint-initdb.d/

# Expose port 3306 to allow external connections to the database
EXPOSE 3306

# Set environment variables for MariaDB
ENV MYSQL_DATABASE=panel \
    MYSQL_USER=pterodactyl \
    MYSQL_PASSWORD=CHANGE_ME \
    MYSQL_ROOT_PASSWORD=CHANGE_ME_TOO

# Use the official redis image for the cache service
FROM redis:alpine

# Expose port 6379 to allow external connections to the cache
EXPOSE 6379

# Use the official pterodactyl panel image
FROM ghcr.io/pterodactyl/panel:latest

# Set the working directory
WORKDIR /app

# Expose ports 80 and 443 for HTTP and HTTPS respectively
EXPOSE 80
EXPOSE 443

# Copy the nginx configuration files into the container
COPY ./nginx/ /etc/nginx/http.d/

# Copy the Let's Encrypt certificates into the container
COPY ./certs/ /etc/letsencrypt/

# Copy the logs directory into the container
COPY ./logs/ /app/storage/logs/

# Set environment variables for the panel
ENV APP_URL=http://example.com \
    APP_TIMEZONE=UTC \
    APP_SERVICE_AUTHOR=noreply@example.com \
    MAIL_FROM=noreply@example.com \
    MAIL_DRIVER=smtp \
    MAIL_HOST=mail \
    MAIL_PORT=1025 \
    MAIL_USERNAME= \
    MAIL_PASSWORD= \
    MAIL_ENCRYPTION=true \
    DB_PASSWORD=CHANGE_ME \
    APP_ENV=production \
    APP_ENVIRONMENT_ONLY=false \
    CACHE_DRIVER=redis \
    SESSION_DRIVER=redis \
    QUEUE_DRIVER=redis \
    REDIS_HOST=cache \
    DB_HOST=database \
    DB_PORT=3306

# Start the panel service
CMD ["php", "artisan", "serve", "--host=0.0.0.0", "--port=8000"]
