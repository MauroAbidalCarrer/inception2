FROM debian:buster

ARG DOMAIN_NAME
ARG CERTS_

RUN apt-get update
RUN apt-get install -y nginx openssl

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -subj "/C=FR/L=KH/O=1337/OU=student/CN=[maabidal.42.fr](http:\/\/maabidal.42.fr)/"
#RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out $CERTS_ -subj "/C=FR/L=KH/O=1337/OU=student/CN=[maabidal.42.fr](http:\/\/$DOMAIN_NAME)/"

EXPOSE 443:443

ADD conf/nginx_conf /etc/nginx/sites-available/default
ADD tools/setup_nginx.sh /setup_nginx.sh

COPY ./index.nginx-debian.html /var/www/html/wordpress/index.nginx-debian.html

RUN chmod +x /setup_nginx.sh
ENTRYPOINT ["/setup_nginx.sh"]
