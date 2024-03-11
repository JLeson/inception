FROM	debian:oldstable

RUN	apt update -y
RUN	apt upgrade -y

RUN	apt install mariadb-server -y

COPY	./conf/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY	./tools/setup-database.sh /

ENTRYPOINT	["sh", "./setup-database.sh"]
