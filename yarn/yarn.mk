-include ../../@bin/config/base.mk

.PHONY: help
SHELL := /bin/bash

help:
	@echo 'Available Commands:'
	@egrep '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":"}; { if ($$3 == "") { printf " - \033[36m%-18s\033[0m %s\n", $$1, $$2 } else { printf " - \033[36m%-18s\033[0m %s\n", $$2, $$3 }}'

#==============================================================#
# NODEJS                                                       #
#==============================================================#
yarn-import: ## Recreate yarn.lock with lastest package.json state (keeping a temp backup)
	yarn -v # step to validate that yarn binary is installed and in your $PATH
	cp yarn.lock yarn.lock.back
	rm yarn.lock
	npm install -g npm
	npm install && npm audit fix && rm package-lock.json
	yarn import # create yarn.lock form package.json
	@if [ ! -f ./yarn.lock ]; then\
		cp yarn.lock.back yarn.lock;\
		echo "=========================================================";\
    	echo "yarn.lock creation FAILED, please check the output error ";\
		echo "=========================================================";\
	else\
		echo "=========================================================";\
    	echo "yarn.lock with updated dependencies SUCCESSFULLY created ";\
		echo "=========================================================";\
	fi
