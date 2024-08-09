#!/bin/bash

set -euo pipefail

mkdir -p "/etc/nginx/ssl"
mkdir -p "/run/nginx"

if [ ! -f "$CERTS_CRT" ] || [ ! -f "$CERTS_KEY" ]; then
    echo "Generating self-signed SSL certificate..."
    openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
        -out "$CERTS_CRT" \
        -keyout "$CERTS_KEY" \
        -subj "/C=FR/ST=Paris/L=Paris/O=42 School/OU=${MYSQL_USER}/CN=${DOMAIN_NAME}/"
    echo "SSL certificate generated."
else
    echo "Using existing SSL certificate."
fi

nginx -g "daemon off;"