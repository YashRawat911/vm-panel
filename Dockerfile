# Use the base Pterodactyl Panel image
FROM ghcr.io/pterodactyl/panel:latest

# Set the working directory
WORKDIR /app

# Set environment variables
ENV APP_URL="http://example.com"
ENV APP_TIMEZONE="UTC"
ENV APP_SERVICE_AUTHOR="noreply@example.com"
ENV MAIL_FROM="noreply@example.com"
ENV MAIL_DRIVER="smtp"
ENV MAIL_HOST="mail"
ENV MAIL_PORT="1025"
ENV MAIL_USERNAME=""
ENV MAIL_PASSWORD=""
ENV MAIL_ENCRYPTION="true"
ENV DB_HOST="database"
ENV DB_PORT="3306"
ENV DB_DATABASE="panel"
ENV DB_USERNAME="pterodactyl"
ENV DB_PASSWORD="CHANGE_ME"
ENV CACHE_DRIVER="redis"
ENV SESSION_DRIVER="redis"
ENV QUEUE_DRIVER="redis"
ENV REDIS_HOST="cache"

# Expose port 8080
EXPOSE 8080
