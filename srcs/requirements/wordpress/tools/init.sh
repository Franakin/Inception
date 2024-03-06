#!/bin/bash

sleep 10

if [ ! -f "/var/www/wordpress/wp-config.php" ]; then
    cd /var/www/wordpress
    wp config create --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=mariadb:3306 --allow-root
    wp core install --url=$DOMAIN_NAME --title=Inception --admin_user=$WP_ADMIN --admin_password=$WP_APASS --admin_email=$WP_AMAIL --allow-root
    wp user create $WP_USER $WP_UMAIL --allow-root --user_pass=$WP_UPASS --role=author
fi

/usr/sbin/php-fpm7.4 -F