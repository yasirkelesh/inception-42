FROM debian:buster

# Gerekli paketlerin yüklenmesi
RUN apt-get update && apt-get install -y nginx

# Nginx konfigürasyon dosyasının kopyalanması
COPY ./conf/default/ /etc/nginx/sites-enabled/default



EXPOSE 443 80