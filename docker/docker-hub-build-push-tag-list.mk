-include ../../@bin/config/base.mk

.PHONY: help

.PHONY: help

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
	LIST=(${DOCKER_TAG_LIST});\
    OLDIFS=$$IFS;\
    IFS=',';\
    for i in "$${LIST[@]}"; do\
		set -- $$i;\
        echo -----------------------;\
        echo DOCKER TAG: $$1;\
        echo -----------------------;\
				docker build -t ${DOCKER_REPO_NAME}/${DOCKER_IMG_NAME}:$$1 .;\
        echo -----------------------;\
        echo "DOCKER BUILD DONE";\
        echo "";\
	done;\
	IFS=$$OLDIFS

build-no-cache: ## build docker image no cache
	LIST=(${DOCKER_TAG_LIST});\
    OLDIFS=$$IFS;\
    IFS=',';\
    for i in "$${LIST[@]}"; do\
		set -- $$i;\
        echo -----------------------;\
        echo DOCKER TAG: $$1;\
        echo -----------------------;\
				docker build --no-cache -t ${DOCKER_REPO_NAME}/${DOCKER_IMG_NAME}:$$1 .;\
        echo -----------------------;\
        echo "DOCKER BUILD NO-CACHE DONE";\
        echo "";\
	done;\
	IFS=$$OLDIFS

push: ## push docker image to registry
	LIST=(${DOCKER_TAG_LIST});\
    OLDIFS=$$IFS;\
    IFS=',';\
    for i in "$${LIST[@]}"; do\
		set -- $$i;\
        echo -----------------------;\
        echo DOCKER TAG: $$1;\
        echo -----------------------;\
				docker push ${DOCKER_REPO_NAME}/${DOCKER_IMG_NAME}:$$1;\
        echo -----------------------;\
        echo "DOCKER PUSH DONE";\
        echo "";\
	done;\
	IFS=$$OLDIFS
