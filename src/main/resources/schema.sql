-- Full DB setup for URL Shortener (WIT Advanced Java)
-- Works in phpMyAdmin SQL tab OR mysql client. XAMPP default: root / no password.
CREATE DATABASE IF NOT EXISTS shortdb CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE shortdb;

CREATE TABLE IF NOT EXISTS users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(50) UNIQUE NOT NULL,
  pass VARCHAR(100) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS urls (
  id INT AUTO_INCREMENT PRIMARY KEY,
  code VARCHAR(10) UNIQUE NOT NULL,
  long_url TEXT NOT NULL,
  clicks INT NOT NULL DEFAULT 0,
  user_id INT,
  CONSTRAINT fk_urls_user FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE SET NULL
) ENGINE=InnoDB;

-- demo logins (admin + 3 group members for individual demo)
INSERT IGNORE INTO users(name, pass) VALUES
 ('admin','admin123'),
 ('m1','m123'),
 ('m2','m123'),
 ('m3','m123'),
 ('m4','m123');

-- sample short links so dashboard is not empty on first run
INSERT IGNORE INTO urls(code, long_url, clicks, user_id) VALUES
 ('wit001','https://www.witsolapur.org', 5, 1),
 ('lib002','https://www.google.com', 2, 1);
