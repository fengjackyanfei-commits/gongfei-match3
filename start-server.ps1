$ErrorActionPreference = "Stop"

$projectRoot = Split-Path -Parent $MyInvocation.MyCommand.Path
$port = 8000

while (Test-NetConnection -ComputerName 127.0.0.1 -Port $port -InformationLevel Quiet -WarningAction SilentlyContinue) {
  $port++
}

Write-Host "Starting local web server..."
Write-Host "Project: $projectRoot"
Write-Host "URL: http://127.0.0.1:$port/index.html"

Set-Location -LiteralPath $projectRoot
node -e @"
const http = require('http');
const fs = require('fs');
const path = require('path');
const types = { '.html': 'text/html; charset=utf-8', '.jpg': 'image/jpeg', '.png': 'image/png', '.css': 'text/css', '.js': 'text/javascript' };
http.createServer((req, res) => {
  const urlPath = decodeURIComponent(req.url.split('?')[0]);
  let file = path.join(process.cwd(), urlPath === '/' ? 'index.html' : urlPath);
  fs.readFile(file, (error, data) => {
    if (error) { res.writeHead(404); res.end('Not found'); return; }
    res.setHeader('Content-Type', types[path.extname(file)] || 'application/octet-stream');
    res.end(data);
  });
}).listen($port, '127.0.0.1', () => console.log('Game ready on http://127.0.0.1:$port/index.html'));
"@
