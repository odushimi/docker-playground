# Puppeteer POC

A proof-of-concept demonstrating Puppeteer/Chromium automation inside a Docker container. This script navigates to the Node.js website, clicks on the Learn section, and generates a PDF of the documentation page.

## Features

- Automated browser navigation using Puppeteer
- Navigates to Node.js official website
- Finds and clicks the Learn link
- Generates PDF with filename based on page title
- Runs in a containerized environment

## Prerequisites

- Docker Desktop (for Windows/Mac) or Docker Engine (for Linux)
- PowerShell (for Windows users)

## Quick Start

### Using the Helper Script (Windows)

```powershell
.\run-local.ps1
```

This script will:
1. Build the Docker image
2. Run the container with volume mounting for PDF output
3. Generate the PDF in the current directory

### Manual Build and Run

Build the Docker image:

```powershell
docker build -t puppeteer-poc:latest .
```

Run the container:

```powershell
docker run --rm -v "${PWD}:/home/pptruser/app/output" puppeteer-poc:latest
```

On Linux/Mac:

```bash
docker run --rm -v "$(pwd):/home/pptruser/app/output" puppeteer-poc:latest
```

## Output

The script generates a PDF file in the project directory with a filename based on the page title:

```
node_js___introduction_to_node_js.pdf
```

## Expected Behavior

1. Navigates to `https://nodejs.org/`
2. Finds and clicks the "Learn" link
3. Navigates to the Node.js Learn page (Introduction to Node.js)
4. Captures the page as PDF with name: `node_js___introduction_to_node_js.pdf`
5. Outputs: "Page title: Node.js — Introduction to Node.js"

## Troubleshooting

- If PDF is not generated, ensure Docker has proper volume mount permissions
- Check Docker logs for Puppeteer errors
- Verify Docker Desktop is running (Windows/Mac users)

## Technology Stack

- Node.js
- Puppeteer v21.0.0
- Docker (using official Puppeteer base image)
- Chromium (headless browser)
