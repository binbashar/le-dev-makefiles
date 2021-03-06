.PHONY: build
#DOCKER_TAG := v1.11.10
#DOCKER_TAG := v1.12.10
#DOCKER_TAG := v1.13.8
DOCKER_TAG := v1.14.4
#DOCKER_TAG := v1.15.1

LOCAL_OS_KUBE_DIR             := ~/.kube
LOCAL_OS_RESOLV_CONF          := /etc/resolv.conf
LOCAL_OS_USER                 = $(shell whoami)
LOCAL_OS_HOME_DIR_ESCAPED     := \\/home\\/${LOCAL_OS_USER}
DOCKER_IMG_NAME               := k8s-kubectx
DOCKER_IMG_USER               := root
K8S_CONTEXT                   := cluster-kops-1.k8s.devstg.binbash.aws
K8S_KUBECTL_CONFIG_FILE_NAME  := config
K8S_KUBECTL_CONFIG_FILE_PATH  := /${DOCKER_IMG_USER}/.kube/${K8S_CONTEXT}

define K8S_KUBE_CMD_PREFIX
docker run -it --rm \
-v ${LOCAL_OS_KUBE_DIR}:/${DOCKER_IMG_USER}/.kube \
-v ${LOCAL_OS_RESOLV_CONF}:/etc/resolv.conf \
-e "KUBECONFIG=${K8S_KUBECTL_CONFIG_FILE_PATH}" \
binbash/${DOCKER_IMG_NAME}:${DOCKER_TAG}
endef

define K8S_KUBECTX_CMD_PREFIX
docker run -it --rm \
-v ${LOCAL_OS_KUBE_DIR}:/${DOCKER_IMG_USER}/.kube \
-v ${LOCAL_OS_RESOLV_CONF}:/etc/resolv.conf \
-e "KUBECONFIG=${K8S_KUBECTL_CONFIG_FILE_PATH}" \
--entrypoint=/usr/local/bin/kubectx binbash/${DOCKER_IMG_NAME}:${DOCKER_TAG}
endef

define K8S_KUBENS_CMD_PREFIX
docker run -it --rm \
-v ${LOCAL_OS_KUBE_DIR}:/${DOCKER_IMG_USER}/.kube \
-v ${LOCAL_OS_RESOLV_CONF}:/etc/resolv.conf \
-e "KUBECONFIG=${K8S_KUBECTL_CONFIG_FILE_PATH}" \
--entrypoint=/usr/local/bin/kubens binbash/${DOCKER_IMG_NAME}:${DOCKER_TAG}
endef

define K8S_KUBECTL_CMD_PREFIX
docker run -it --rm \
-v ${LOCAL_OS_KUBE_DIR}:/${DOCKER_IMG_USER}/.kube \
-v ${LOCAL_OS_RESOLV_CONF}:/etc/resolv.conf \
-e "KUBECONFIG=${K8S_KUBECTL_CONFIG_FILE_PATH}" \
--entrypoint=/usr/local/bin/kubectl binbash/${DOCKER_IMG_NAME}:${DOCKER_TAG}
endef

define K8S_KUBECTL_CMD_BASH_PREFIX
docker run -it --rm \
-v ${LOCAL_OS_KUBE_DIR}:/${DOCKER_IMG_USER}/.kube \
-v ${LOCAL_OS_RESOLV_CONF}:/etc/resolv.conf \
-e "KUBECONFIG=${K8S_KUBECTL_CONFIG_FILE_PATH}" \
--entrypoint=bash binbash/${DOCKER_IMG_NAME}:${DOCKER_TAG}
endef

help:
	@echo 'Available Commands:'
	@egrep '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":"}; { if ($$3 == "") { printf " - \033[36m%-18s\033[0m %s\n", $$1, $$2 } else { printf " - \033[36m%-18s\033[0m %s\n", $$2, $$3 }}'

test-run-kubectx-bash: ## docker run bash
	@echo ''
	sed -i -e "s/${LOCAL_OS_HOME_DIR_ESCAPED}/\\/${DOCKER_IMG_USER}/g" ${LOCAL_OS_KUBE_DIR}/config
	@echo ''
	${K8S_KUBECTL_CMD_BASH_PREFIX}
	@echo ''
	sed -i -e "s/\\/${DOCKER_IMG_USER}/${LOCAL_OS_HOME_DIR_ESCAPED}/g" ${LOCAL_OS_KUBE_DIR}/config

test-run-kubectx-kubens-cmds: ## docker run kubectx and kubens --help to test
	@echo ''
	sed -i -e "s/${LOCAL_OS_HOME_DIR_ESCAPED}/\\/${DOCKER_IMG_USER}/g" ${LOCAL_OS_KUBE_DIR}/config
	@echo ''
	${K8S_KUBE_CMD_PREFIX} kubectx --help && kubectl config get-contexts
	@echo ''
	${K8S_KUBE_CMD_PREFIX} kubens --help && kubectl get ns
	@echo ''
	sed -i -e "s/\\/${DOCKER_IMG_USER}/${LOCAL_OS_HOME_DIR_ESCAPED}/g" ${LOCAL_OS_KUBE_DIR}/config

test-run-kubectx-kubens: ## test-run: docker run with kubectx and kubens overrided entrypoints.
	@echo ''
	sed -i -e "s/${LOCAL_OS_HOME_DIR_ESCAPED}/\\/${DOCKER_IMG_USER}/g" ${LOCAL_OS_KUBE_DIR}/config
	@echo ''
	${K8S_KUBECTX_CMD_PREFIX} --help
	@echo ''
	${K8S_KUBECTX_CMD_PREFIX}
	${K8S_KUBECTX_CMD_PREFIX} ${K8S_CONTEXT}
	@echo ''
	${K8S_KUBENS_CMD_PREFIX} --help
	@echo ''
	${K8S_KUBENS_CMD_PREFIX}
	${K8S_KUBENS_CMD_PREFIX} kube-system
	@echo ''
	sed -i -e "s/\\/${DOCKER_IMG_USER}/${LOCAL_OS_HOME_DIR_ESCAPED}/g" ${LOCAL_OS_KUBE_DIR}/config

test-run-kubectl: ## docker run kubectl commands
	@echo ''
	sed -i -e "s/${LOCAL_OS_HOME_DIR_ESCAPED}/\\/${DOCKER_IMG_USER}/g" ${LOCAL_OS_KUBE_DIR}/config
	@echo ''
	@echo ''
	${K8S_KUBECTL_CMD_PREFIX} version
	@echo ''
	${K8S_KUBECTL_CMD_PREFIX} config --kubeconfig=/${DOCKER_IMG_USER}/.kube/${K8S_KUBECTL_CONFIG_FILE_NAME} view --minify
	@echo ''
	${K8S_KUBECTL_CMD_PREFIX} --context=${K8s_CONTEXT} get nodes
	@echo ''
	${K8S_KUBECTL_CMD_PREFIX} --context=${K8s_CONTEXT} get svc
	@echo ''
	${K8S_KUBECTL_CMD_PREFIX} --context=${K8s_CONTEXT} get pods --all-namespaces
	@echo ''
	${K8S_KUBECTL_CMD_PREFIX} --context=${K8s_CONTEXT} get pods --namespace=kube-system
	@echo ''
	sed -i -e "s/\\/${DOCKER_IMG_USER}/${LOCAL_OS_HOME_DIR_ESCAPED}/g" ${LOCAL_OS_KUBE_DIR}/config
