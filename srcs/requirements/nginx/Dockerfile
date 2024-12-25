FROM debian:buster

# Gerekli paketlerin yüklenmesi
RUN apt-get update && apt-get install -y nginx

# Nginx konfigürasyon dosyasının kopyalanması
COPY ./conf/default/ /etc/nginx/sites-enabled/default

# Custom script'in kopyalanması ve çalıştırma izninin verilmesi
COPY ./tools/nginx_start.sh /var/www/nginx_start.sh
RUN chmod +x /var/www/nginx_start.sh

# Script tamamlandıktan sonra Nginx'in başlatılmasını sağlayan bir ENTRYPOINT yapılandırması
ENTRYPOINT ["/bin/bash", "-c", "/var/www/nginx_start.sh && exec nginx -g 'daemon off;'"]

EXPOSE 443
