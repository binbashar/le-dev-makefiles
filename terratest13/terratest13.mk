.PHONY: help
SHELL                  := /bin/bash

PROJECT_SHORT          := bb

LOCAL_OS_USER_ID       := $(shell id -u)
LOCAL_OS_GROUP_ID      := $(shell id -g)
LOCAL_OS_SSH_DIR       := ~/.ssh
LOCAL_OS_GIT_CONF_DIR  := ~/.gitconfig
LOCAL_OS_AWS_CONF_DIR  := ~/.aws/${PROJECT_SHORT}

# localhost aws-iam-profile
#LOCAL_OS_AWS_PROFILE := bb-shared-deploymaster
# ci aws-iam-profile
LOCAL_OS_AWS_PROFILE  :="bb-dev-deploymaster"
LOCAL_OS_AWS_REGION   := us-east-1

TF_PWD_DIR            := $(shell pwd)
TF_VER                := 0.13.2
TF_PWD_CONT_DIR       := "/go/src/project"
TF_DOCKER_ENTRYPOINT  := /bin/terraform
TF_DOCKER_IMAGE       := binbash/terraform-awscli-terratest-slim

TERRATEST_DOCKER_ENTRYPOINT := dep
TERRATEST_DOCKER_WORKDIR    := ${TF_PWD_CONT_DIR}/tests

#
# TERRAFORM
#
define TF_CMD_PREFIX
docker run --rm \
-v ${TF_PWD_DIR}:${TF_PWD_CONT_DIR}:rw \
--entrypoint=${TF_DOCKER_ENTRYPOINT} \
-w ${TF_PWD_CONT_DIR} \
-it ${TF_DOCKER_IMAGE}:${TF_VER}
endef

#
# TERRATEST
#
define TERRATEST_GO_CMD_PREFIX
docker run --rm \
-v ${TF_PWD_DIR}:${TF_PWD_CONT_DIR}:rw \
-v ${LOCAL_OS_SSH_DIR}:/root/.ssh \
-v ${LOCAL_OS_GIT_CONF_DIR}:/etc/gitconfig \
-v ${LOCAL_OS_AWS_CONF_DIR}:/root/.aws/${PROJECT_SHORT} \
-e AWS_SHARED_CREDENTIALS_FILE=/root/.aws/${PROJECT_SHORT}/credentials \
-e AWS_CONFIG_FILE=/root/.aws/${PROJECT_SHORT}/config \
-w ${TERRATEST_DOCKER_WORKDIR} \
-it ${TF_DOCKER_IMAGE}:${TF_VER}
endef

define TERRATEST_GO_CMD_BASH_PREFIX
docker run --rm \
-v ${TF_PWD_DIR}:${TF_PWD_CONT_DIR}:rw \
-v ${LOCAL_OS_SSH_DIR}:/root/.ssh \
-v ${LOCAL_OS_GIT_CONF_DIR}:/etc/gitconfig \
-v ${LOCAL_OS_AWS_CONF_DIR}:/root/.aws/${PROJECT_SHORT} \
-e AWS_SHARED_CREDENTIALS_FILE=/root/.aws/${PROJECT_SHORT}/credentials \
-e AWS_CONFIG_FILE=/root/.aws/${PROJECT_SHORT}/config \
-w ${TERRATEST_DOCKER_WORKDIR} \
--entrypoint=bash \
-it ${TF_DOCKER_IMAGE}:${TF_VER}
endef

define TERRATEST_DEP_CMD_PREFIX
docker run --rm \
-v ${TF_PWD_DIR}:${TF_PWD_CONT_DIR}:rw \
-v ${LOCAL_OS_SSH_DIR}:/root/.ssh \
-v ${LOCAL_OS_GIT_CONF_DIR}:/etc/gitconfig \
--entrypoint=${TERRATEST_DOCKER_ENTRYPOINT} \
-w ${TERRATEST_DOCKER_WORKDIR} \
-it ${TF_DOCKER_IMAGE}:${TF_VER}
endef

help:
	@echo 'Available Commands:'
	@egrep '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":"}; { if ($$3 == "") { printf " - \033[36m%-18s\033[0m %s\n", $$1, $$2 } else { printf " - \033[36m%-18s\033[0m %s\n", $$2, $$3 }}'

#==============================================================#
# TERRAFORM HELPERS                                            #
#==============================================================#
pre-commit: ## Execute validation: pre-commit run --all-files.
	pre-commit run --all-files

terraform-docs: ## A utility to generate documentation from Terraform 0.12 modules in various output formats.
	docker run --rm \
  	-v $$(pwd):/data \
  	cytopia/terraform-docs:0.9.1 \
  	terraform-docs-012 --sort-inputs-by-required --with-aggregate-type-defaults markdown table .

#==============================================================#
# TERRATEST                                                    #
#==============================================================#
terratest-dep-init: ## dep is a dependency management tool for Go. (https://github.com/golang/dep)
	${TERRATEST_DEP_CMD_PREFIX} init
	${TERRATEST_DEP_CMD_PREFIX} ensure
	sudo chown -R ${LOCAL_OS_USER_ID}:${LOCAL_OS_GROUP_ID} .

terratest-go-test: ## Run E2E terratests
	${TERRATEST_GO_CMD_PREFIX} test -timeout 20m
	sudo chown -R ${LOCAL_OS_USER_ID}:${LOCAL_OS_GROUP_ID} .

terratest-go-test-bash: ## Run E2E terratests interactive bash
	${TERRATEST_GO_CMD_BASH_PREFIX}

