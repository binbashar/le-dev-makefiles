-include ../../@bin/config/base.mk

.PHONY: help
SHELL := /bin/bash

LOCAL_OS_USER_ID                 = $(shell id -u)
LOCAL_OS_GROUP_ID                = $(shell id -g)
LOCAL_OS_SSH_DIR                 := ~/.ssh
LOCAL_OS_GIT_CONF_DIR            := ~/.gitconfig
LOCAL_OS_AWS_CONF_DIR            := ~/.aws/${PROJECT_SHORT}

TF_PWD_DIR                       = $(shell pwd)
TF_PWD_CONT_DIR                  := "/go/src/project/"
TF_VER                           := 1.0.9
TF_DOCKER_ENTRYPOINT             := /bin/terraform
TF_DOCKER_IMAGE                  := binbash/terraform-awscli-slim

define TF_CMD_PREFIX
docker run --security-opt="label:disable" --rm \
-v ${TF_PWD_DIR}:${TF_PWD_CONT_DIR}:rw \
-v ${LOCAL_OS_SSH_DIR}:/root/.ssh \
-v ${LOCAL_OS_GIT_CONF_DIR}:/etc/gitconfig \
-v ${LOCAL_OS_AWS_CONF_DIR}:/root/.aws/${PROJECT_SHORT} \
-e AWS_SHARED_CREDENTIALS_FILE=/root/.aws/${PROJECT_SHORT}/credentials \
-e AWS_CONFIG_FILE=/root/.aws/${PROJECT_SHORT}/config \
--entrypoint=${TF_DOCKER_ENTRYPOINT} \
-w ${TF_PWD_CONT_DIR} \
-it ${TF_DOCKER_IMAGE}:${TF_VER}
endef

help:
	@echo 'Available Commands:'
	@egrep '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":"}; { if ($$3 == "") { printf " - \033[36m%-18s\033[0m %s\n", $$1, $$2 } else { printf " - \033[36m%-18s\033[0m %s\n", $$2, $$3 }}'

#==============================================================#
# TERRAFORM                                                    #
#==============================================================#
version: ## Show terraform version
	docker run --security-opt="label:disable" --rm \
	--entrypoint=${TF_DOCKER_ENTRYPOINT} \
	-t ${TF_DOCKER_IMAGE}:${TF_VER} version

format: ## The terraform fmt is used to rewrite tf conf files to a canonical format and style.
	${TF_CMD_PREFIX} fmt -recursive

format-check: ## The terraform fmt is used to rewrite tf conf files to a canonical format and style.
	${TF_CMD_PREFIX} fmt -recursive -check ${TF_PWD_CONT_DIR}

#==============================================================#
# TERRAFORM HELPERS                                            #
#==============================================================#
pre-commit: ## Execute validation: pre-commit run --all-files.
	pre-commit run --all-files
