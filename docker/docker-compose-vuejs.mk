.PHONY: help
SHELL         := /bin/bash

# setup your env tier: dev || prd
DOCKER_COMPOSE_FILE := docker-compose-${DOCKER_ENVIRONMENT}.yaml
DOCKER_COMPOSE_CMD  := COMPOSE_DOCKER_CLI_BUILD=1 DOCKER_BUILDKIT=1 docker-compose -f ${DOCKER_COMPOSE_FILE}

help:
	@echo 'Available Commands:'
	@egrep '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":"}; { if ($$3 == "") { printf " - \033[36m%-18s\033[0m %s\n", $$1, $$2 } else { printf " - \033[36m%-18s\033[0m %s\n", $$2, $$3 }}'

#==============================================================#
# DOCKER-COMPOSE                                               #
#==============================================================#
build: ## Build local environment images
	${DOCKER_COMPOSE_CMD} build

build-no-cache: ## Build local environment images --no-cache
	${DOCKER_COMPOSE_CMD} build --no-cache

build-prd: ## Build local environment prd images
	DOCKER_BUILDKIT=1 docker build -t ${DOCKER_IMAGE_NAME}:${DOCKER_RELEASE_TAG} --target prd .

up: ## Start local environment (docker-compose up -d)
	${DOCKER_COMPOSE_CMD} up -d

stop: ## Stop local environment
	${DOCKER_COMPOSE_CMD} down

rm: ## Stop and remove all local environment containers
	${DOCKER_COMPOSE_CMD} stop
	${DOCKER_COMPOSE_CMD} rm --force

ps: ## Show running containers status
	${DOCKER_COMPOSE_CMD} ps

app-logs: ## Show boostrap-vue env logs
	${DOCKER_COMPOSE_CMD} logs --tail=10 ${APP_ENV_ID}-${DOCKER_ENVIRONMENT}

app-sh: ## Get into bootstrap-vue container through a shell
	${DOCKER_COMPOSE_CMD} exec ${APP_ENV_ID}-${DOCKER_ENVIRONMENT} bash

build-dist: ## Deploy builded version to AWS || eg: make APP_ENVIRONMENT="dev" deploy-dist-aws
	DOCKER_BUILDKIT=1 docker build -t ${DOCKER_IMAGE_NAME}:${DOCKER_RELEASE_TAG} --target prd .
	docker run -d --name "${DOCKER_IMAGE_NAME}-${DOCKER_RELEASE_TAG}" ${DOCKER_IMAGE_NAME}:${DOCKER_RELEASE_TAG}
	docker cp ${DOCKER_IMAGE_NAME}-${DOCKER_RELEASE_TAG}:/usr/share/nginx/html/ ./dist/
	docker rm ${DOCKER_IMAGE_NAME}-${DOCKER_RELEASE_TAG} --force

deploy-dist-aws: ## Deploy builded version to AWS || eg: make APP_ENVIRONMENT="dev" deploy-dist-aws
	DOCKER_BUILDKIT=1 docker build -t ${DOCKER_IMAGE_NAME}:${DOCKER_RELEASE_TAG} --target prd .
	docker run -d --name "${DOCKER_IMAGE_NAME}-${DOCKER_RELEASE_TAG}" ${DOCKER_IMAGE_NAME}:${DOCKER_RELEASE_TAG}
	docker cp ${DOCKER_IMAGE_NAME}-${DOCKER_RELEASE_TAG}:/usr/share/nginx/html/ ./dist/
	docker rm ${DOCKER_IMAGE_NAME}-${DOCKER_RELEASE_TAG} --force
	bash @bin/scripts/bb-le-apps-s3-sync.sh ${APP_ENVIRONMENT}
