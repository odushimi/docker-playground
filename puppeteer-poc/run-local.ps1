# Puppeteer POC - Build and Run Script
# This script builds the Docker image and runs the Puppeteer automation
# The PDF output will be saved in the current directory

Set-Location -Path "$PSScriptRoot"

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Puppeteer POC - Build and Run" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Build the Docker image
Write-Host "Building Docker image puppeteer-poc:latest..." -ForegroundColor Yellow
docker build -t puppeteer-poc:latest .

if ($LASTEXITCODE -ne 0) {
    Write-Error "Docker build failed with exit code $LASTEXITCODE"
    exit $LASTEXITCODE
}

Write-Host ""
Write-Host "Build successful!" -ForegroundColor Green
Write-Host ""

# Run the container with volume mount for PDF output
Write-Host "Running Puppeteer automation..." -ForegroundColor Yellow
Write-Host "PDF will be saved to: $PSScriptRoot" -ForegroundColor Gray
Write-Host ""

docker run --rm -v "${PSScriptRoot}:/home/pptruser/app/output" puppeteer-poc:latest

if ($LASTEXITCODE -ne 0) {
    Write-Error "Container execution failed with exit code $LASTEXITCODE"
    exit $LASTEXITCODE
}

Write-Host ""
Write-Host "========================================" -ForegroundColor Green
Write-Host "Execution completed successfully!" -ForegroundColor Green
Write-Host "Check the current directory for the generated PDF" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green
