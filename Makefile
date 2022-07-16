.PHONY:

# ==============================================================================
# Docker

cluster_session_develop:
	echo "Starting session cluster flink"
	docker-compose up -d --build taskmanager

jobs_submit:
	echo "Starting jobs submit flink"
	docker-compose up --build job_submit

develop: maven_build cluster_session_develop jobs_submit


# ==============================================================================
# Maven

maven_build:
	mvn clean install