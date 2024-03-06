VOL_WORDPRESS=/home/fpurdom/data/wordpress
VOL_MARIADB=/home/fpurdom/data/mariadb

all	: $(VOL_WORDPRESS) $(VOL_MARIADB)
	docker compose -f ./srcs/docker-compose.yml up -d

down :
	docker compose -f ./srcs/docker-compose.yml down

clean	:
	rm -rf $(VOL_WORDPRESS)
	rm -rf $(VOL_MARIADB)
	docker rmi nginx:0.69 wordpress:0.69 mariadb:0.69

$(VOL_WORDPRESS) :
	mkdir $@ -p

$(VOL_MARIADB) :
	mkdir $@ -p