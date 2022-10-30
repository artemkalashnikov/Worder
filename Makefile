up:
	docker-compose --env-file=docker-compose.env up -d
	docker ps

down:
	docker-compose --env-file=docker-compose.env down
	docker ps -a

build:
	docker-compose --env-file=docker-compose.env build

bash-app:
	docker exec -it python_app_1 bash
