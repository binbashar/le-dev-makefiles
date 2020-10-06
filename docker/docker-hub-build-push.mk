.PHONY: help
SHELL         := /bin/bash

help:
	@echo 'Available Commands:'
	@egrep '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":"}; { if ($$3 == "") { printf " - \033[36m%-18s\033[0m %s\n", $$1, $$2 } else { printf " - \033[36m%-18s\033[0m %s\n", $$2, $$3 }}'

#==============================================================#
# DOCKER-COMPOSE                                               #
#==============================================================#
build: ## build docker image
	docker build -t ${DOCKER_REPO_NAME}/${DOCKER_IMG_NAME}:${DOCKER_TAG} -t ${DOCKER_REPO_NAME}/${DOCKER_IMG_NAME}:latest .

build-no-cache: ## build docker image no cache
	docker build --no-cache -t ${DOCKER_REPO_NAME}/${DOCKER_IMG_NAME}:${DOCKER_TAG} -t ${DOCKER_REPO_NAME}/${DOCKER_IMG_NAME}:latest .

push: ## push docker image to registry
	docker push ${DOCKER_REPO_NAME}/${DOCKER_IMG_NAME}:${DOCKER_TAG} && docker push ${DOCKER_REPO_NAME}/${DOCKER_IMG_NAME}:latest
