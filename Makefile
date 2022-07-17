.PHONY:

# ==============================================================================
# Docker support

FILES := $(shell docker ps -aq)

down-local:
	docker stop $(FILES)
	docker rm $(FILES)

clean-all:
	docker system prune --all --force --volumes

clean:
	docker system prune -f

logs-local:
	docker logs -f $(FILES)

# ==============================================================================
# Docker

schema-cql:
	echo "schemas cql"
	docker-compose run cqlsh -f /schema.cql

cassandra-cluster:
	echo "Starting cassandra cluster"
	docker-compose up --build cassandra

cluster-session-develop:
	echo "Starting session cluster flink"
	docker-compose up -d --build taskmanager

jobs-submit:
	echo "Starting jobs submit flink"
	docker-compose up --build job-submit

crate-topics:
	echo "Crate topics kafka"
	docker exec -it kafka kafka-topics --zookeeper zookeeper:2181 --create --topic product --partitions 1 --replication-factor 1
	docker exec -it kafka kafka-topics --zookeeper zookeeper:2181 --create --topic product-price --partitions 1 --replication-factor 1

mock-topics:
	docker exec -it kafka /mock/runner.sh

local: maven-build jobs-submit

# ==============================================================================
# Maven

maven-build:
	mvn clean install