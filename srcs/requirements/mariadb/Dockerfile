FROM debian:bullseye

RUN apt update -y; \
    apt upgrade -y; \
    apt-get install mariadb-server -y

RUN mkdir -p /var/run/mysqld; \
    chown -R mysql:mysql /var/run/mysqld; \
    chown -R mysql:mysql /var/lib/mysql

COPY conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf

COPY ./tools/script.sh /

RUN mysql_install_db --user=mysql --datadir=/var/lib/mysql

EXPOSE 3306

CMD ["/script.sh"]