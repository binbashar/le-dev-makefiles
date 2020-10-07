.PHONY: help
SHELL         := /bin/bash

# Local Env VARs
#
LOCAL_OS_PWD_DIR  = $(shell pwd)
LOCAL_OS_HOME_DIR = $(shell echo ~)
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
K8s_KIND_CMD                       := KUBECONFIG='${LOCAL_OS_KUBE_DIR}/${K8S_KIND_KUBECONFIG_FILE_NAME}' kind
K8s_KIND_NODE_VERSION              := v1.14.10
K8S_KIND_KUBECONFIG_FILE_PATH      := /${DOCKER_IMG_USER}/.kube/${K8S_KIND_KUBECONFIG_FILE_NAME}
K8S_KIND_KUBECTL_CONTEXT           := kind-${K8S_KIND_CLUSTER_NAME}

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
	@egrep '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":"}; { if ($$3 == "") { printf " - \033[36m%-18s\033[0m %s\n", $$1, $$2 } else { printf " - \033[36m%-18s\033[0m %s\n", $$2, $$3 }}'

#==============================================================#
# K8s KIND													   #
#==============================================================#
kind-create-cluster: ## run the create cluster command
	${K8s_KIND_CMD} version
	${K8s_KIND_CMD} create cluster --config kind.config.yaml --name ${K8S_KIND_CLUSTER_NAME} --image kindest/node:${K8s_KIND_NODE_VERSION}
	${K8s_KIND_CMD} get clusters
	${K8s_KIND_CMD} get kubeconfig --name ${K8S_KIND_CLUSTER_NAME}

kind-get-cluster: ## run the create cluster command
	${K8s_KIND_CMD} version
	${K8s_KIND_CMD} get clusters
	${K8s_KIND_CMD} get kubeconfig --name ${K8S_KIND_CLUSTER_NAME}

kind-delete-cluster: ## run the delete cluster command
	${K8s_KIND_CMD} version
	${K8s_KIND_CMD} delete cluster --name ${K8S_KIND_CLUSTER_NAME}
	${K8s_KIND_CMD} get clusters

kind-kubectl-test-cluster: ## docker run kubectl commands
	@echo ''
	${K8S_HELMSMAN_CMD_PREFIX} kubectl version
	@echo ''
	${K8S_HELMSMAN_CMD_PREFIX} kubectl config get-contexts
	@echo ''
	${K8S_HELMSMAN_CMD_PREFIX} kubectl config --kubeconfig=${K8S_KIND_KUBECONFIG_FILE_PATH} view --minify
	@echo ''
	${K8S_HELMSMAN_CMD_PREFIX} kubectl --context=${K8S_KIND_KUBECTL_CONTEXT} get nodes
	@echo ''
	${K8S_HELMSMAN_CMD_PREFIX} kubectl --context=${K8S_KIND_KUBECTL_CONTEXT} get svc --all-namespaces
	@echo ''
	${K8S_HELMSMAN_CMD_PREFIX} kubectl --context=${K8S_KIND_KUBECTL_CONTEXT} get ingress --all-namespaces
	@echo ''
	${K8S_HELMSMAN_CMD_PREFIX} kubectl --context=${K8S_KIND_KUBECTL_CONTEXT} get  pods --all-namespaces
	@echo ''
	${K8S_HELMSMAN_CMD_PREFIX} kubectl --context=${K8S_KIND_KUBECTL_CONTEXT} get pods --namespace=kube-system
