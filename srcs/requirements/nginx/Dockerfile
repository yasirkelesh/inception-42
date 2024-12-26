FROM debian:buster

# Gerekli paketlerin yüklenmesi
RUN apt-get update && apt-get install -y nginx

# Nginx konfigürasyon dosyasının kopyalanması
COPY ./conf/nginx.conf/ /etc/nginx/nginx.conf
COPY ./tools/fullchain.pem  /var/www 
COPY ./tools/privkey.pem  /var/www



EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
