.PHONY: help
SHELL := /bin/bash

GIT_BRANCH_NAME       := master
GIT_GITHUB_ORG        := binbashar
GIT_REPO_PREFIX       := git@github.com:${GIT_GITHUB_ORG}

help:
	@echo 'Available Commands:'
	@egrep '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":"}; { if ($$3 == "") { printf " - \033[36m%-18s\033[0m %s\n", $$1, $$2 } else { printf " - \033[36m%-18s\033[0m %s\n", $$2, $$3 }}'

#==============================================================#
# GIT MODULE MGMT											   #
#==============================================================#
git-clone-repo: ## Git clone repo
	REPOS=(${REPOS_LIST});\
    OLDIFS=$$IFS;\
    IFS=',';\
    for i in "$${REPOS[@]}"; do\
		set -- $$i;\
        echo -----------------------;\
        echo $$1;\
        echo -----------------------;\
        git clone ${GIT_REPO_PREFIX}/$$1.git;\
        echo -----------------------;\
        echo "GIT CLONE DONE";\
        echo "";\
	done;\
	IFS=$$OLDIFS

git-pull-master: ## Git pull repo from master branch
	REPOS=(${REPOS_LIST});\
    OLDIFS=$$IFS;\
    IFS=',';\
    for i in "$${REPOS[@]}"; do\
		set -- $$i;\
        cd $$1;\
        echo -----------------------;\
        echo $$1;\
        echo -----------------------;\
        git checkout ${GIT_BRANCH_NAME};\
        git pull origin ${GIT_BRANCH_NAME};\
        echo -----------------------;\
        echo "GIT PULL BRANCH ${GIT_BRANCH_NAME} DONE";\
        cd ..;\
        echo "";\
	done;\
	IFS=$$OLDIFS

git-discard-changes-repo: ## Git checkout . repo (to discard local changes)
	REPOS=(${REPOS_LIST});\
    OLDIFS=$$IFS;\
    IFS=',';\
    for i in "$${REPOS[@]}"; do\
		set -- $$i;\
        cd $$1;\
        echo -----------------------;\
        echo $$1;\
        echo -----------------------;\
        git checkout ${GIT_BRANCH_NAME};\
        git checkout .;\
        echo -----------------------;\
        echo "GIT CHECKOUT . DONE";\
        cd ..;\
        echo "";\
	done;\
	IFS=$$OLDIFS

git-sync-fork-upstream: ## Git sync from master forked upstream repos
	REPOS=(${REPOS_LIST});\
    OLDIFS=$$IFS;\
    IFS=',';\
    for i in "$${REPOS[@]}"; do\
        set -- $$i;\
		if [ "$$2" != "" ]; then\
			cd $$1;\
			echo -----------------------;\
			echo $$1;\
			echo $$2;\
			echo -----------------------;\
			git checkout ${GIT_BRANCH_NAME};\
			git pull origin ${GIT_BRANCH_NAME};\
			git remote add upstream https://github.com/$$2;\
			git fetch --tags upstream;\
			git pull upstream ${GIT_BRANCH_NAME};\
			git push origin ${GIT_BRANCH_NAME};\
			git push -f --tags origin ${GIT_BRANCH_NAME};\
			echo -----------------------;\
			echo "GIT FORK TAG SYNC W/ REPO $$2 DONE";\
			cd ..;\
			echo "";\
		fi;\
	done;\
	IFS=$$OLDIFS

git-sync-tag-fork-upstream: ## Git tag sync from master forked upstream repos
	REPOS=(${REPOS_LIST});\
    OLDIFS=$$IFS;\
    IFS=',';\
    for i in "$${REPOS[@]}"; do\
        set -- $$i;\
		if [ "$$2" != "" ]; then\
			cd $$1;\
			echo -----------------------;\
			echo $$1;\
			echo $$2;\
			echo -----------------------;\
			git checkout ${GIT_BRANCH_NAME};\
			git pull origin ${GIT_BRANCH_NAME};\
			git remote add upstream https://github.com/$$2;\
			git fetch --tags upstream;\
			git push -f --tags origin ${GIT_BRANCH_NAME};\
			echo -----------------------;\
			echo "GIT FORK TAG SYNC W/ REPO $$2 DONE";\
			cd ..;\
			echo "";\
		fi;\
	done;\
	IFS=$$OLDIFS
