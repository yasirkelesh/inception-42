# Inception: System Administration Project with Docker

## 📖 Overview
This project focuses on enhancing system administration skills by working with Docker containers. You'll virtualize several Docker images and create a personal virtual infrastructure adhering to predefined specifications.

## 🛠 Features
- **Mandatory Setup**:
  - NGINX container with TLSv1.2 or TLSv1.3 for secure access.
  - WordPress + php-fpm container, fully installed and configured.
  - MariaDB container for database management.
  - Volumes for:
    - WordPress database.
    - WordPress website files.
  - Docker network for inter-container communication.
  - Proper error recovery with container auto-restarts.
  - Environment variable support and secure credentials management.

- **Bonus Features** (optional):
  - Redis caching for WordPress.
  - FTP server for WordPress volume access.
  - Static website (e.g., portfolio or showcase site) using any language except PHP.
  - Adminer setup for database administration.
  - Additional custom service (to be defined).

## 📂 Directory Structure
The project is organized as follows:

![Ekran Resmi 2025-01-25 20 29 40](https://github.com/user-attachments/assets/b453ad1b-4026-43de-85a0-049bdc978fe1)

## 📜 Guidelines
- Containers follow best practices and avoid infinite loops (tail -f, bash, etc.).
- NGINX is the sole entry point, serving requests only through port 443.
- Adheres to Dockerfile standards (no pre-built images pulled from DockerHub).
