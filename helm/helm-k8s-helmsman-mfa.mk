-include ../../@bin/config/base.mk

.PHONY: help
SHELL                := /bin/bash

LOCAL_PWD            	= $(shell pwd)
LOCAL_PARENT_DIR     	= $(shell basename "$$PWD")
LOCAL_OS_AWS_CONF_DIR 	:= ~/.aws/${PROJECT_SHORT}
LOCAL_KUBE_CONFIG    	:= ~/.kube/${PROJECT_SHORT}/${LOCAL_PARENT_DIR}
LOCAL_HOME_DIR			:= ~
DOCKER_IMG_NAME      	:= binbash/helmsman:v3.4.3-helm-v3.2.1

define HELMSMAN
docker run -it --rm \
-v ${LOCAL_OS_AWS_CONF_DIR}:/root/.aws/${PROJECT_SHORT} \
-v ${LOCAL_KUBE_CONFIG}:/root/.kube/orig \
-v ~/.kube/cache:/root/.kube/cache \
-v ${LOCAL_PWD}:/app \
-e KUBECONFIG=/root/.kube/config \
-e SOURCE_KUBECONFIG=/root/.kube/orig \
-e USER_HOME=${LOCAL_HOME_DIR} \
-w /app \
--entrypoint ./run-aws-iam-authenticator.sh \
${DOCKER_IMG_NAME}
endef

define HELMSMAN_SHELL
docker run -it --rm \
-v ${LOCAL_OS_AWS_CONF_DIR}:/root/.aws/${PROJECT_SHORT} \
-v ${LOCAL_KUBE_CONFIG}:/root/.kube/orig \
-v ~/.kube/cache:/root/.kube/cache \
-v ${LOCAL_PWD}:/app \
-e KUBECONFIG=/root/.kube/config \
-e SOURCE_KUBECONFIG=/root/.kube/orig \
-e USER_HOME=${LOCAL_HOME_DIR} \
-w /app \
--entrypoint sh \
${DOCKER_IMG_NAME}
endef

help:
	@echo 'Available Commands:'
	@egrep '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":"}; { if ($$3 == "") { printf " - \033[36m%-18s\033[0m %s\n", $$1, $$2 } else { printf " - \033[36m%-18s\033[0m %s\n", $$2, $$3 }}'

#==============================================================#
# K8s HELMSMAN                                                 #
#==============================================================#
plan: ## Run helmsman in plan mode to preview any changes
	${HELMSMAN} helmsman -f helmsman.yaml

debug: ## Run helmsman in plan mode showing additional execution logs
	${HELMSMAN} helmsman -f helmsman.yaml --debug

diff:
	${HELMSMAN} helmsman -f helmsman.yaml --show-diff

dry-run: ## Run helmsman in dry-run mode to simulate what will be changed without actually applying
	${HELMSMAN} helmsman -f helmsman.yaml --dry-run

dry-run-debug: ## Run helmsman in dry-run mode showing additional execution logs
	${HELMSMAN} helmsman -f helmsman.yaml --dry-run --debug

apply: ## Run helmsman in apply mode to perform any required changes
	${HELMSMAN} helmsman -f helmsman.yaml --apply

shell: ## Run a shell in the container
	${HELMSMAN_SHELL}
