-include ../../@bin/config/base.mk

.PHONY: help
SHELL                    := /bin/bash

LOCAL_OS_USER_ID         = $(shell id -u)
LOCAL_OS_GROUP_ID        = $(shell id -g)
MKDOCS_DOCKER_IMG        := squidfunk/mkdocs-material:9.5.42
# GOOGLE_ANALYTICS_KEY: must be preset as os.ENV var

help:
	@echo 'Available Commands:'
	@egrep '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":"}; { if ($$3 == "") { printf " - \033[36m%-18s\033[0m %s\n", $$1, $$2 } else { printf " - \033[36m%-18s\033[0m %s\n", $$2, $$3 }}'

#==============================================================#
# DOCUMENTATION                                                #
#==============================================================#
docs-deploy-gh: ## deploy to Github pages
	docker run --rm -it \
	-v ~/.ssh:/root/.ssh \
	-v ${PWD}:/docs \
	-e GOOGLE_ANALYTICS_KEY=${GOOGLE_ANALYTICS_KEY} \
	--entrypoint=sh \
	${MKDOCS_DOCKER_IMG} -c 'apk add git && \
	git config --global --add safe.directory /docs && \
	mkdocs gh-deploy --clean --message "CircleCI deploying to gh-pages [ci skip]" --remote-branch gh-pages'
	sudo chown -R ${LOCAL_OS_USER_ID}:${LOCAL_OS_GROUP_ID} ./site
	rm -rf ./site

docs-live: ## Build and launch a local copy of the documentation website in http://localhost:8000
	@docker run --rm -it \
		-p 8000:8000 \
		-v ${PWD}:/docs \
		-e GOOGLE_ANALYTICS_KEY=UA-17XXXXX42-1 \
		${MKDOCS_DOCKER_IMG}

docs-check-dead-links: ## Check if the documentation contains dead links.
	@docker run -t \
	  -v $$PWD:/tmp aledbf/awesome_bot:0.1 \
	  --allow-dupe \
	  --allow-redirect $(shell find $$PWD -mindepth 1 -name "*.md" -printf '%P\n' | grep -v vendor | grep -v Changelog.md)
	sudo chown -R ${LOCAL_OS_USER_ID}:${LOCAL_OS_GROUP_ID} ab-results-*
	rm -rf ab-results-*
