# Docker Playground

A collection of Docker-based proof-of-concepts (POCs) and experiments for testing different technologies and containerization approaches.

## Overview

This repository serves as a testing ground for exploring various technologies, frameworks, and tools using Docker. Each subdirectory contains a self-contained POC demonstrating a specific technology or use case.

## Projects

### 🎭 Puppeteer POC
**Location:** `puppeteer-poc/`

Automated browser testing and web scraping using Puppeteer and Chromium in a containerized environment.

- **Technology:** Node.js, Puppeteer, Chromium
- **Use Case:** Browser automation, web scraping, PDF generation
- **Features:**
  - Automated navigation and interaction with web pages
  - PDF generation from web content
  - Runs in Docker with official Puppeteer base image
  - CI/CD integration with GitHub Actions

**Quick Start:**
```bash
cd puppeteer-poc
./run-local.ps1  # Windows
```

See [puppeteer-poc/README.md](puppeteer-poc/README.md) for detailed documentation.

---

## Getting Started

### Prerequisites

- [Docker Desktop](https://www.docker.com/products/docker-desktop) (Windows/Mac) or Docker Engine (Linux)
- PowerShell (for Windows scripts)
- Basic understanding of Docker and containerization

### Project Structure

```
docker-playground/
├── puppeteer-poc/          # Puppeteer browser automation POC
│   ├── Dockerfile
│   ├── index.js
│   ├── package.json
│   ├── run-local.ps1
│   └── README.md
├── .github/
│   └── workflows/          # GitHub Actions workflows
└── README.md               # This file
```

## Adding New POCs

When adding a new proof-of-concept:

1. Create a new directory with a descriptive name (e.g., `python-flask-poc`)
2. Include a `Dockerfile` for building the container
3. Add a `README.md` with:
   - Description of the technology/use case
   - Prerequisites
   - Build and run instructions
   - Expected output
4. Add helper scripts if needed (e.g., `run-local.ps1` for Windows)
5. Update this main README with a link to your POC

## Technologies to Explore

Future POCs may include:

- 🐍 Python web frameworks (Flask, FastAPI, Django)
- ☕ Java Spring Boot applications
- 🦀 Rust microservices
- 🗄️ Database containers (PostgreSQL, MongoDB, Redis)
- 🔄 Message queues (RabbitMQ, Kafka)
- 🌐 Web servers (Nginx, Apache)
- 📊 Data processing pipelines
- 🤖 Machine learning models
- And more...

## CI/CD

This repository uses GitHub Actions for automated testing and validation. Each POC may have its own workflow in `.github/workflows/`.

## Contributing

Feel free to add your own POCs and experiments! Each project should be self-contained and well-documented.

## License

This is a personal playground repository for learning and experimentation.

## Resources

- [Docker Documentation](https://docs.docker.com/)
- [Docker Hub](https://hub.docker.com/)
- [Best Practices for Writing Dockerfiles](https://docs.docker.com/develop/develop-images/dockerfile_best-practices/)
