-include ../../@bin/config/base.mk

.PHONY: help
SHELL            := /bin/bash
DOCKER_REPO_NAME := binbash

help:
	@echo 'Available Commands:'
	@egrep '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":"}; { if ($$3 == "") { printf " - \033[36m%-18s\033[0m %s\n", $$1, $$2 } else { printf " - \033[36m%-18s\033[0m %s\n", $$2, $$3 }}'

#==============================================================#
# DOCKER                                                       #
#==============================================================#
build: ## build docker image
	docker buildx build \
		--platform linux/amd64,linux/arm64,linux/arm/v6,linux/arm/v7,linux/arm/v8 \
		-t ${DOCKER_REPO_NAME}/${DOCKER_IMG_NAME}:${DOCKER_TAG} \
		--build-arg DOCKER_TAG='${DOCKER_TAG}' .

push: ## push docker image to registry
	docker buildx build \
		--platform linux/amd64,linux/arm64,linux/arm/v6,linux/arm/v7,linux/arm/v8 \
		--push \
		-t ${DOCKER_REPO_NAME}/${DOCKER_IMG_NAME}:${DOCKER_TAG} \
		--build-arg DOCKER_TAG='${DOCKER_TAG}' .

