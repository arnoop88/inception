all: volume
	docker compose -f ./srcs/docker-compose.yml up -d --build

down:
	docker compose -f ./srcs/docker-compose.yml down

re: down clean all

clean:
	docker stop $$(docker ps -qa);\
	docker rm $$(docker ps -qa);\
	docker rmi -f $$(docker images -qa);\
	docker volume rm $$(docker volume ls -q);\

volume:
	mkdir -p $(HOME)/data/mysql $(HOME)/data/wordpress

status:
	docker ps -a

.PHONY: all re down clean status
