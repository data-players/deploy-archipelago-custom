DC= docker-compose
path-cron = $(shell pwd)/compact-cron.sh
path-cron-dev = $(shell pwd)/compact-cron-dev.sh
dev= docker-compose -f docker-compose-dev.yaml
link= docker-compose -f docker-compose-link.yaml

build:
	$(DC) build --no-cache

build-dev:
	$(dev) build --no-cache

start: 
	$(DC) up -d

stop: 
	$(DC) down

logs:
	$(DC) logs -f

logs-dev:
	$(dev) logs -f

start-dev: 
	$(dev) up -d

stop-dev: 
	$(dev) down

start-dockerfile: 
	$(dockerfile) up -d

stop-dockerfile: 
	$(dockerfile) down

logs-dockerfile:
	$(dockerfile) logs -f

compact: 
	$(DC) down && $(DC) up fuseki_compact && $(DC) up -d

compact-dev:
	$(dev) down && $(dev) up fuseki_compact && $(dev) up -d

start-link: 
	$(link) up -d

stop-link: 
	$(link) down

set-compact-cron: 
	(crontab -l 2>/dev/null; echo "0 4 * * * $(path-cron) >> /tmp/cronlog.txt") | crontab -

set-compact-cron-dev: 
	(crontab -l 2>/dev/null; echo "0 4 * * * $(path-cron-dev) >> /tmp/cronlog.txt") | crontab -

prune-data:
	sudo rm -rf ./data