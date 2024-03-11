FROM	debian:oldstable

RUN	apt update
RUN	apt upgrade

RUN	apt install curl -y
RUN	apt install php7.4 -y
RUN	apt install php7.4-fpm -y
RUN	apt install php7.4-mysqli -y
RUN	apt install php7.4-json -y
RUN	apt install php7.4-xml -y
RUN	apt install php7.4-curl -y
RUN	apt install php7.4-mbstring -y
RUN	apt install mariadb-client -y

RUN	curl https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar --output /usr/local/bin/wp

COPY	./tools/wp_config.sh /
COPY	./conf/www.conf	/etc/php/7.4/fpm/pool.d/

RUN	chmod 777 /usr/local/bin/wp
RUN	chmod 777 /wp_config.sh

WORKDIR	/var/www/wordpress
ENTRYPOINT	["sh", "/wp_config.sh"]
