FROM	debian:oldstable

RUN	apt update -y
RUN	apt upgrade -y

RUN	apt install nginx -y
RUN	apt install openssl -y

RUN	mkdir -p /etc/nginx/ssl
RUN	mkdir -p /var/run/nginx

RUN	openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=NL/ST=NH/L=Amsterdam/O=42/UID=fsarkoh/CN=fsarkoh.42.fr" 

COPY	./conf/nginx.conf /etc/nginx/conf.d/nginx.conf

EXPOSE	443

ENTRYPOINT	["nginx", "-g","daemon off;"]
