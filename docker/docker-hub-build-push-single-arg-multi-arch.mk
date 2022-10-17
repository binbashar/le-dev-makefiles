-include ../../@bin/config/base.mk

.PHONY: help
SHELL            := /bin/bash
DOCKER_REPO_NAME := binbash

# if more docker tags have to be passed, set a var as follows in your calle makefile:
# ADDITIONAL_TAGS := "tag1,tag2,tagn"
#
ifdef ADDITIONAL_TAGS
	ADT := $(shell echo ${ADDITIONAL_TAGS}|tr ',' ' ')
	ADDITIONAL_TAGS_INTERNAL := $(foreach arg, ${ADT}, -t${DOCKER_REPO_NAME}/${DOCKER_IMG_NAME}:$(arg))
else
	ADDITIONAL_TAGS_INTERNAL :=
endif

# if a specific platform has to be targeted set in your called makefile this var setting your platforms as value:
# TARGET_PLATFORMS := 'linux/amd64,linux/arm64,linux/arm/v6'
#
TARGET_PLATFORMS_DEFAULT := 'linux/amd64,linux/arm64,linux/arm/v6,linux/arm/v7,linux/arm/v8'
ifdef TARGET_PLATFORMS
	TARGET_PLATFORMS_INTERNAL:= ${TARGET_PLATFORMS}
else
	TARGET_PLATFORMS_INTERNAL:= ${TARGET_PLATFORMS_DEFAULT}
endif

# if more docker build args have to be passed, set a var as follows in your calle makefile:
# ADDITIONAL_DOCKER_ARGS := "ARG1='value1',ARG2='value2',ARG3='value3'"
#
ifdef ADDITIONAL_DOCKER_ARGS
	ADA := $(shell echo ${ADDITIONAL_DOCKER_ARGS}|tr ',' ' ')
	OTHER_DOCKER_ARGS := $(foreach arg, ${ADA},  --build-arg $(arg))
else
	OTHER_DOCKER_ARGS :=
endif

help:
	@echo 'Available Commands:'
	@egrep '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":"}; { if ($$3 == "") { printf " - \033[36m%-18s\033[0m %s\n", $$1, $$2 } else { printf " - \033[36m%-18s\033[0m %s\n", $$2, $$3 }}'

#==============================================================#
# DOCKER                                                       #
#==============================================================#
build: setbuildxenv runbuildxlocal ## build docker image

push: setbuildxenv runbuildxpush  ## push docker image to registry

runbuildxlocal:
	docker buildx build \
	    --builder=container \
	    --load \
		-t ${DOCKER_REPO_NAME}/${DOCKER_IMG_NAME}:${DOCKER_TAG} ${ADDITIONAL_TAGS_INTERNAL} \
		--build-arg DOCKER_TAG='${DOCKER_TAG}'${OTHER_DOCKER_ARGS} .

runbuildxpush:
	@docker buildx build \
	    --builder=container \
		--platform ${TARGET_PLATFORMS_INTERNAL} \
		--push \
		-t ${DOCKER_REPO_NAME}/${DOCKER_IMG_NAME}:${DOCKER_TAG} ${ADDITIONAL_TAGS_INTERNAL} \
		--build-arg DOCKER_TAG='${DOCKER_TAG}'${OTHER_DOCKER_ARGS} .

setbuildxenv:
	@((docker buildx rm container 2> /dev/null && echo "Container deleted") || echo "No container to delete") && \
	docker run --privileged --rm tonistiigi/binfmt --install all && \
	docker buildx create --name container --driver docker-container
