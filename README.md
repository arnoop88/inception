# Inception

## Table of Contents
- [Overview](#overview)
- [Features](#features)
- [Project Structure](#project-structure)
- [Services](#services)
  - [WordPress](#wordpress)
  - [MariaDB](#mariadb)
  - [NGINX](#nginx)
  - [Adminer](#adminer)
  - [cAdvisor](#cadvisor)
  - [FTP](#ftp)
  - [Redis](#redis)
  - [Website](#website)
- [Installation](#installation)
- [Resources](#resources)

## Overview
**Inception** is a project focused on building a secure multi-container Docker-based application environment. The goal is to set up various services (NGINX, MariaDB, WordPress) within Docker containers, each service isolated but interacting through a common network. This README provides a complete overview of the project, including the bonus features: Adminer, cAdvisor, FTP, Redis, and a Rock Paper Scissors game website.

## Features
- Multi-container Docker application
- Secure deployment of essential services like WordPress, MariaDB, and NGINX
- Docker-compose configuration for seamless management
- Volume and network management within Docker for isolation and security
- Bonus services for advanced features

## Project Structure
The project is organized as follows:

```bash
📂 inception
├── 📂 srcs
│   ├── 📂 requirements
│   │   ├── 📂 mariadb
│   │   ├── 📂 nginx
│   │   ├── 📂 wordpress
│   │   ├── 📂 bonus
│   │   │   ├── 📂 adminer
│   │   │   ├── 📂 cadvisor
│   │   │   ├── 📂 ftp
│   │   │   ├── 📂 redis
│   │   │   └── 📂 website
│   └── docker-compose.yml
├── Makefile
└── README.md
```

## Services

### NGINX
- Acts as a reverse proxy and HTTP server for the WordPress site.
- Configured to handle SSL with self-signed certificates.

### MariaDB
- The database engine for the WordPress site, deployed as a container.
- WordPress uses this MariaDB instance to store its data.

### WordPress
- A fully functional WordPress site, served by NGINX and connected to MariaDB.
- Installed and running within its own container.

### Adminer
- A lightweight database management tool to interact with the MariaDB instance.
- Accessible via web interface to manage databases in MariaDB.

### cAdvisor
- A tool to monitor resource usage (CPU, memory, etc.) of all running containers.
- Provides real-time monitoring of all Docker containers, useful for system diagnostics.

### FTP
- Allows file transfers between the host and containers.
- Secure FTP server accessible to upload or download files from specific containers.

### Redis
- Redis caching service to optimize the performance of WordPress.
- Runs as a separate container and connects to WordPress.

### Website
- A simple web-based Rock Paper Scissors game.
- Deployed as an additional service and accessible via a unique URL.
- Built using HTML/CSS/JavaScript and hosted via a small web server container.

## Installation
1. Clone the repository:
   ```bash
   git clone https://github.com/arnoop88/inception.git
   cd inception
   ```

2. Build and start the Docker containers:
	```bash
	make
	```

3. Once the services are up, you can access:
	- WordPress: `https://localhost/`
	- Adminer: `http://localhost:2080/`
	- cAdvisor: `http://localhost:8080/`
	- FTP: Configure FTP client to connect to `localhost` using provided credentials.
	- Redis: The Redis service runs in the background and can be accessed by WordPress.
	- Rock Paper Scissors Game: `http://localhost:3000/`

## Resources
- [Docker Documentation](https://docs.docker.com/build/concepts/overview/)
- [Docker Compose Documentation](https://docs.docker.com/compose/compose-application-model/)
- [Wordpress](https://wordpress.org/)
- [Adminer](https://www.adminer.org/)
- [cAdvisor](https://github.com/google/cadvisor)
- [Redis](https://redis.io/)