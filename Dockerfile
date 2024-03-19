version: '3.8'
services:
  database:
    image: mariadb:10.5
    restart: always
    command: --default-authentication-plugin=mysql_native_password
    environment:
      MYSQL_DATABASE: "panel"
      MYSQL_USER: "pterodactyl"
      MYSQL_PASSWORD: "CHANGE_ME"
      MYSQL_ROOT_PASSWORD: "CHANGE_ME_TOO"
    volumes:
      - "database:/var/lib/mysql"

  cache:
    image: redis:alpine
    restart: always

  panel:
    image: ghcr.io/pterodactyl/panel:latest
    restart: always
    ports:
      - "8080:8080"
    environment:
      APP_URL: "http://example.com"
      APP_TIMEZONE: "UTC"
      APP_SERVICE_AUTHOR: "noreply@example.com"
      MAIL_FROM: "noreply@example.com"
      MAIL_DRIVER: "smtp"
      MAIL_HOST: "mail"
      MAIL_PORT: "1025"
      MAIL_USERNAME: ""
      MAIL_PASSWORD: ""
      MAIL_ENCRYPTION: "true"
      DB_HOST: "database"
      DB_PORT: "3306"
      DB_DATABASE: "panel"
      DB_USERNAME: "pterodactyl"
      DB_PASSWORD: "CHANGE_ME"
      CACHE_DRIVER: "redis"
      SESSION_DRIVER: "redis"
      QUEUE_DRIVER: "redis"
      REDIS_HOST: "cache"
    volumes:
      - "panel:/app/var/"
      - "nginx:/etc/nginx/http.d/"
      - "certs:/etc/letsencrypt/"
      - "logs:/app/storage/logs"

volumes:
  database:
  panel:
  nginx:
  certs:
  logs:
