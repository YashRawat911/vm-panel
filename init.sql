-- Example initialization SQL script
CREATE DATABASE IF NOT EXISTS panel;
GRANT ALL ON panel.* TO 'pterodactyl'@'%' IDENTIFIED BY 'CHANGE_ME';
FLUSH PRIVILEGES;
