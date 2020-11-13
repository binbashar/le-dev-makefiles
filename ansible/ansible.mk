-include ../@bin/config/base.mk

.PHONY: help
SHELL := /bin/bash

LOCAL_OS_USER_ID					= $(shell id -u)
LOCAL_OS_GROUP_ID					= $(shell id -g)
LOCAL_OS_SSH_DIR					:= ~/.ssh/${PROJECT_SHORT}
LOCAL_OS_GIT_CONF_DIR     := ~/.gitconfig

ANSIBLE_PWD_ROOT_DIR			= $(shell cd .. && pwd)
ANSIBLE_PWD_PLAY_DIR      = $(shell pwd | rev | cut -d '/' -f 1 | rev)
ANSIBLE_DOCKER_ENTRYPOINT :=
ANSIBLE_CONT_USER 				:= root
ANSIBLE_CONT_PWD_DIR			:= /${ANSIBLE_CONT_USER}/ansible
ANSIBLE_VAULT_FILE				:= ~/.ansible/vault/${PROJECT_SHORT}
ANSIBLE_VER								:= 2.10.3
ANSIBLE_DOCKER_IMAGE			:= binbash/ansible

define ANSIBLE_CMD_PREFIX
docker run --security-opt="label:disable" --rm \
-v ${ANSIBLE_PWD_ROOT_DIR}:${ANSIBLE_CONT_PWD_DIR}:rw \
-v ${LOCAL_OS_SSH_DIR}:/${ANSIBLE_CONT_USER}/.ssh/${PROJECT_SHORT} \
-v ${LOCAL_OS_GIT_CONF_DIR}:/etc/gitconfig \
-v ${ANSIBLE_VAULT_FILE}:/${ANSIBLE_CONT_USER}/.ansible/vault/${PROJECT_SHORT} \
-w ${ANSIBLE_CONT_PWD_DIR}/${ANSIBLE_PWD_PLAY_DIR} \
-e no_proxy="*" \
--entrypoint=${ANSIBLE_DOCKER_ENTRYPOINT} \
-it ${ANSIBLE_DOCKER_IMAGE}:${ANSIBLE_VER}
endef

define ANSIBLE_CMD_BASH_PREFIX
docker run --security-opt="label:disable" --rm \
-v ${ANSIBLE_PWD_ROOT_DIR}:${ANSIBLE_CONT_PWD_DIR}:rw \
-v ${LOCAL_OS_SSH_DIR}:/${ANSIBLE_CONT_USER}/.ssh/${PROJECT_SHORT} \
-v ${LOCAL_OS_GIT_CONF_DIR}:/etc/gitconfig \
-v ${ANSIBLE_VAULT_FILE}:/${ANSIBLE_CONT_USER}/.ansible/vault/${PROJECT_SHORT} \
-e no_proxy="*" \
--entrypoint=bash \
-w ${ANSIBLE_CONT_PWD_DIR}/${ANSIBLE_PWD_PLAY_DIR} \
-it ${ANSIBLE_DOCKER_IMAGE}:${ANSIBLE_VER}
endef

# ANSIBLE VARS
ANSIBLE_TAGS = $$(echo $@ | cut -d "-" -f 2- | sed "s/%*$$//")

help:
	@echo 'Available Commands:'
	@egrep '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":"}; { if ($$3 == "") { printf " - \033[36m%-18s\033[0m %s\n", $$1, $$2 } else { printf " - \033[36m%-18s\033[0m %s\n", $$2, $$3 }}'

#==============================================================#
# ANSIBLE                                                      #
#==============================================================#
pwd-dir-chown: ## run chown in ./roles to grant that the docker mounted dir has the right permissions
	@echo LOCAL_OS_USER_ID: ${LOCAL_OS_USER_ID}
	@echo LOCAL_OS_GROUP_ID: ${LOCAL_OS_GROUP_ID}
	sudo chown -R ${LOCAL_OS_USER_ID}:${LOCAL_OS_GROUP_ID} ./roles
	sudo chown -R ${LOCAL_OS_USER_ID}:${LOCAL_OS_GROUP_ID} ./group_vars

shell: ## Initialize terraform backend, plugins, and modules
	${ANSIBLE_CMD_BASH_PREFIX}

init: init-cmd pwd-dir-chown ## Install required ansible roles
init-cmd:
	${ANSIBLE_CMD_PREFIX} ansible-galaxy install -f -r requirements.yml --roles-path ./roles/

apply: ## run ansible-playbook
	${ANSIBLE_CMD_PREFIX} ansible-playbook setup.yml

apply-%: ## Provision only the given tags (e.g. make apply-security-users or make apply-openvpn-pritunl)
	${ANSIBLE_CMD_PREFIX} ansible-playbook setup.yml --tags $(ANSIBLE_TAGS)

check: ## run ansible-playbook in Check Mode (“Dry Run”)
	${ANSIBLE_CMD_PREFIX} ansible-playbook setup.yml --check

decrypt: decrypt-cmd pwd-dir-chown ## Decrypt secrets.tf via ansible-vault
decrypt-cmd:
	${ANSIBLE_CMD_PREFIX} ansible-vault decrypt --output ./group_vars/secrets.dec.yml ./group_vars/secrets.enc.yml

decrypt-string: ## Decrypt encrypted string via ansible-vault - e.g. make ARG="your_encrypted_srting" decrypt-string
	${ANSIBLE_CMD_PREFIX} bash ../@bin/scripts/ansible-vault-decrypt-str.sh ${ARG}

encrypt: encrypt-cmd pwd-dir-chown ## Encrypt secrets.dec.tf via ansible-vault
encrypt-cmd:
	${ANSIBLE_CMD_PREFIX} ansible-vault encrypt --output ./group_vars/secrets.enc.yml ./group_vars/secrets.dec.yml \
	&& rm -rf ./group_vars/secrets.dec.yml
