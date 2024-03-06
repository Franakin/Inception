FROM debian:bullseye

RUN apt update -y; \
    apt upgrade -y; \
    apt install nginx -y; \
    apt-get -y install libfcgi0ldbl; \
    mkdir -p /etc/nginx/ssl; \
    apt install openssl -y; \
    openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=NL/ST=Noord Holland/L=Amsterdam/O=Codam/OU=42/CN=fpurdom.42.fr/UID=fpurdom@student.codam.nl"
COPY conf/default /etc/nginx/sites-available/default
RUN chmod 755 /var/www/html; \
    chown -R www-data:www-data /var/www/html

EXPOSE 443

ENTRYPOINT ["nginx"]
CMD ["-g", "daemon off;"]