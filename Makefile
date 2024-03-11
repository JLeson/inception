DOCKER_COMPOSE		=	./srcs/docker-compose.yml
DATA_FOLDER		=	/home/fsarkoh/data
MARIADB_DATA_FOLDER	=	$(DATA_FOLDER)/mariadb
WORDPRESS_DATA_FOLDER	=	$(DATA_FOLDER)/wordpress

all:	up

up:	build
	mkdir -p $(MARIADB_DATA_FOLDER)
	mkdir -p $(WORDPRESS_DATA_FOLDER)
	docker compose -f $(DOCKER_COMPOSE) up

down:
	docker compose -f $(DOCKER_COMPOSE) down

stop:
	docker compose -f $(DOCKER_COMPOSE) stop

start:
	docker compose -f $(DOCKER_COMPOSE) start

status:
	docker ps

build:
	docker compose -f $(DOCKER_COMPOSE) build
