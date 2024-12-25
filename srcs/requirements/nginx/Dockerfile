FROM debian:buster

RUN chmod +x /var/www/nginx_start.sh

ENTRYPOINT ["var/www/nginx_start.sh"]

EXPOSE 443

COPY ./conf/default/ /etc/nginx/sites-enabled/default
COPY ./tools/nginx_start.sh /var/www



CMD ["nginx", "-g", "daemon off;"]

