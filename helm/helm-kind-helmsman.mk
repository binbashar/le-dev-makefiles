.PHONY: help
SHELL         := /bin/bash

# Local Env VARs
#
LOCAL_OS_PWD_DIR  := $(shell pwd)
LOCAL_OS_HOME_DIR := $(shell echo ~)
LOCAL_OS_KUBE_DIR := ${LOCAL_OS_HOME_DIR}/.kube/bb

# Docker VARs
#
DOCKER_IMG_USER   := root
DOCKER_IMG_NAME   := praqma/helmsman
DOCKER_IMG_TAG    := v3.4.1-helm-v3.2.1

# K8s Kind VARs
#
K8S_KIND_CLUSTER_NAME              := local-helm-infra
K8S_KIND_KUBECONFIG_FILE_NAME      := config-kind-${K8S_KIND_CLUSTER_NAME}
K8S_KIND_KUBECONFIG_FILE_PATH      := /${DOCKER_IMG_USER}/.kube/${K8S_KIND_KUBECONFIG_FILE_NAME}
K8S_KIND_KUBECTL_CONTEXT           := kind-${K8S_KIND_CLUSTER_NAME}
K8S_KIND_HELMSMAN_CONFIG_FILE_PATH := /tmp/helmsman.yaml

# Helm VARs
#
HELM_PACKAGE_NAME                  := linkerd2

define K8S_HELMSMAN_CMD_PREFIX
docker run -it --rm \
-v ${LOCAL_OS_KUBE_DIR}:/${DOCKER_IMG_USER}/.kube \
-v ${LOCAL_OS_PWD_DIR}:/tmp:rw \
-e "KUBECONFIG=${K8S_KIND_KUBECONFIG_FILE_PATH}" \
--network host \
${DOCKER_IMG_NAME}:${DOCKER_IMG_TAG}
endef

define K8S_HELMSMAN_CMD_BASH_PREFIX
docker run -it --rm \
-v ${LOCAL_OS_KUBE_DIR}:/${DOCKER_IMG_USER}/.kube \
-v ${LOCAL_OS_PWD_DIR}:/tmp:rw \
-e "KUBECONFIG=${K8S_KIND_KUBECONFIG_FILE_PATH}" \
--network host \
--entrypoint=bash ${DOCKER_IMG_NAME}:${DOCKER_IMG_TAG}
endef

help:
	@echo 'Available Commands:'
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf " - \033[36m%-18s\033[0m %s\n", $$1, $$2}'

#==============================================================#
# K8s HELMSMAN                                                 #
#==============================================================#
plan: ## Run helmsman in plan mode to preview any changes
	${K8S_HELMSMAN_CMD_PREFIX} helmsman -f ${K8S_KIND_HELMSMAN_CONFIG_FILE_PATH}

debug: ## Run helmsman in plan mode showing additional execution logs
	${K8S_HELMSMAN_CMD_PREFIX} helmsman -f ${K8S_KIND_HELMSMAN_CONFIG_FILE_PATH} --debug

diff:
	${K8S_HELMSMAN_CMD_PREFIX} helmsman -f ${K8S_KIND_HELMSMAN_CONFIG_FILE_PATH} --show-diff

dry-run: ## Run helmsman in dry-run mode to simulate what will be changed without actually applying
	${K8S_HELMSMAN_CMD_PREFIX} helmsman -f ${K8S_KIND_HELMSMAN_CONFIG_FILE_PATH} --dry-run

dry-run-debug: ## Run helmsman in dry-run mode showing additional execution logs
	${K8S_HELMSMAN_CMD_PREFIX} helmsman -f ${K8S_KIND_HELMSMAN_CONFIG_FILE_PATH} --dry-run --debug

apply: ## Run helmsman in apply mode to perform any required changes
	${K8S_HELMSMAN_CMD_PREFIX} helmsman -f ${K8S_KIND_HELMSMAN_CONFIG_FILE_PATH} --apply

helmsman-bash: ## docker run helmsman bash
	${K8S_HELMSMAN_CMD_BASH_PREFIX}

helmsman-clean:
	sudo rm -rf ../../.helmsman-tmp

#==============================================================#
# K8s HELM                                                     #
#==============================================================#
helm-list: ## List helm releases
	${K8S_HELMSMAN_CMD_PREFIX} helm list --kube-context ${K8S_KIND_KUBECTL_CONTEXT}

helm-search-hub: ## Find publicly available helm charts
	${K8S_HELMSMAN_CMD_PREFIX} helm search hub ${HELM_PACKAGE_NAME}
