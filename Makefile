DC= docker-compose
path-cron = $(shell pwd)/compact-cron.sh
path-cron-prod = $(shell pwd)/compact-cron-prod.sh
prod= docker-compose-prod.yaml
link= docker-compose-link.yaml

start: 
	$(DC) up -d

stop: 
	$(DC) down

logs:
	$(DC) logs -f

logs-prod:
	$(DC) -f $(prod) logs -f

start-prod: 
	$(DC) -f $(prod) up -d

stop-prod: 
	$(DC) -f $(prod) down

start-link: 
	$(DC) -f $(link) up -d

stop-link: 
	$(DC) -f $(link) down

compact: 
	$(DC) down && $(DC) up fuseki_compact && $(DC) up -d

compact-prod:
	$(DC) -f $(prod) down && $(DC) -f $(prod) up fuseki_compact && $(DC) -f $(prod) up -d

set-compact-cron: 
	(crontab -l 2>/dev/null; echo "* * * * * $(path-cron) >> /tmp/cronlog.txt") | crontab -

set-compact-cron-prod: 
	(crontab -l 2>/dev/null; echo "* * * * * $(path-cron-prod) >> /tmp/cronlog.txt") | crontab -