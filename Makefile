path-cron-prod = $(shell pwd)/compact-cron.sh
path-cron-local = $(shell pwd)/compact-cron-local.sh
local= docker-compose -f docker-compose-local.yaml
prod= docker-compose -f docker-compose-prod.yaml
link= docker-compose -f docker-compose-link.yaml

build-prod:
	$(prod) build --no-cache

build-local:
	$(local) build --no-cache

build-prod:
	$(link) build --no-cache

build-dockerhub:
	docker-compose -f docker-compose-dockerhub.yaml build

start-prod: 
	$(prod) up -d --force-recreate

stop-prod: 
	$(prod) down

logs-prod:
	$(prod) logs -f

logs-local:
	$(local) logs -f

start-local: 
	$(local) up -d --force-recreate

stop-local: 
	$(local) down

start-link: 
	$(link) up -d --force-recreate

stop-link: 
	$(link) down

logs-link:
	$(link) logs -f

restart-prod:
	$(link) down && $(link) up -d

compact-prod: 
	$(prod) down && $(prod) up fuseki_compact && $(prod) up -d

compact-local:
	$(local) down && $(local) up fuseki_compact && $(local) up -d

set-compact-cron-prod: 
	(crontab -l 2>/local/null; echo "0 4 * * * $(path-cron-prod) >> /tmp/cronlog.txt") | crontab -

set-compact-cron-local: 
	(crontab -l 2>/local/null; echo "0 4 * * * $(path-cron-local) >> /tmp/cronlog.txt") | crontab -

prune-data:
	sudo rm -rf ./data