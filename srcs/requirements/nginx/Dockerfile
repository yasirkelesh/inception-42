FROM debian:buster

RUN apt-get update && apt-get install -y nginx

COPY ./conf/default/ /etc/nginx/sites-enabled/default
COPY ./tools/nginx_start.sh /var/www/nginx_start.sh

RUN chmod +x /var/www/nginx_start.sh

ENTRYPOINT ["/var/www/nginx_start.sh"]
EXPOSE 443
CMD ["nginx", "-g", "daemon off;"]