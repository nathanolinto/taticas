init:
	cp .env.example .env
	make up

up:
	docker-compose up -d

stop:
	docker-compose stop

restart:
	docker-compose restart

build:
	make down
	rm -rf .next
	DOCKER_BUILDKIT=0 docker-compose build --no-cache
	make up
	# docker-compose build --no-cache
	# docker-compose up -d --build

down:
	docker-compose down

logs:
	docker-compose logs -f

bash:
	docker-compose exec --user root taticas sh
