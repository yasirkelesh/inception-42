FROM debian:buster

COPY ./conf/default/ /etc/nginx/sites-enabled/default
COPY ./tools/nginx_start.sh /var/www

RUN chmod +x /var/www/nginx_start.sh

ENTRYPOINT ["var/www/nginx_start.sh"]

RUN apt-get update && apt-get install -y nginx

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]

