#!/bin/bash

# .env dosyasını yükle
if [ -f /etc/nginx/.env ]; then
  export $(grep -v '^#' /etc/nginx/.env | xargs)
fi

# nginx.conf.template dosyasını işleyip nginx.conf dosyasını oluştur
envsubst < /etc/nginx/nginx.conf.template > /etc/nginx/nginx.conf

# NGINX'i başlat
exec "$@"