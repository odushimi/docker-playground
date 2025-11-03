# Quick diagnostics to help identify Docker availability on Windows
Write-Host "Checking Docker client version..."
docker --version

Write-Host "Checking Docker info..."
docker info | Out-Host

Write-Host "Checking Docker Desktop service (Windows)..."
Get-Service -Name "com.docker.service" -ErrorAction SilentlyContinue | Format-List *

Write-Host "If WSL2 is used, check WSL status..."
wsl -l -v

Write-Host "If Docker Desktop is not running, start it and re-run these diagnostics."
