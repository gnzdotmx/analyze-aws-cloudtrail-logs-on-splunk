include .env
.PHONY: up down logs logs-api ps

up:
	mkdir mount
	find ./logs -name '*.json' -exec cat {} + | jq -c '.Records[]' > mount/cloudtrail.json
	SPLUNK_PASSWORD=${SPLUNK_PASSWORD} docker-compose -f docker-compose.yml up -d
down:
	docker-compose -f docker-compose.yml down
	rm -rf mount
logs:
	docker-compose -f docker-compose.yml logs --tail=100 -f
logs-api:
	docker-compose -f docker-compose.yml logs --tail=100 -f api
ps:
	docker-compose -f docker-compose.yml ps
