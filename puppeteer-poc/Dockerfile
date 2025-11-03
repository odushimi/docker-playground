# Use the official Puppeteer image which includes Chromium and necessary deps
FROM ghcr.io/puppeteer/puppeteer:latest

# Create app directory and set working dir
WORKDIR /home/pptruser/app

# Copy package files and install dependencies
COPY package*.json ./
RUN npm install --omit=dev

# Copy app source
COPY . .

# Ensure files are owned by the non-root user used by the base image
USER pptruser

# Run the POC
CMD ["node", "index.js"]
