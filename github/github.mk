.PHONY: help
SHELL := /bin/bash

GIT_BRANCH_NAME           := master
GIT_GITHUB_ORG            := binbashar
GIT_REPO_PREFIX           := git@github.com:${GIT_GITHUB_ORG}

help:
	@echo 'Available Commands:'
	@egrep '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":"}; { if ($$3 == "") { printf " - \033[36m%-18s\033[0m %s\n", $$1, $$2 } else { printf " - \033[36m%-18s\033[0m %s\n", $$2, $$3 }}'

#==============================================================#
# GITHUB MODULE MGMT                                           #
#==============================================================#
github-repo-get-all-topics: ## Github get all repo topics - eg: make GITHUB_TOKEN="4df7...406" -f Makefile.github github-repo-get-all-topics
	REPOS=(${REPOS_LIST});\
    OLDIFS=$$IFS;\
    IFS=',';\
    for i in "$${REPOS[@]}"; do\
		set -- $$i;\
        echo -----------------------;\
        echo $$1;\
        echo -----------------------;\
		curl -X GET \
		  -H "Authorization: token ${GITHUB_TOKEN}" \
		  -H "Accept: application/vnd.github.mercy-preview+json" \
		  -H "Content-Type: application/json" \
		  https://api.github.com/repos/${GIT_GITHUB_ORG}/$$1/topics;\
        git clone ${GIT_REPO_PREFIX}/$$1.git;\
        echo -----------------------;\
        echo "GIT CLONE DONE";\
        echo "";\
	done;\
	IFS=$$OLDIFS

github-repo-replace-all-topics: ## Github replace all repo topics - eg: make GITHUB_TOKEN="4df7...406" -f Makefile.github github-repo-replace-all-topics
	REPOS=(${REPOS_LIST});\
    OLDIFS=$$IFS;\
    IFS=',';\
    for i in "$${REPOS[@]}"; do\
		set -- $$i;\
        echo -----------------------;\
        echo $$1;\
        echo -----------------------;\
		curl -X PUT \
		 -H "Authorization: token ${GITHUB_TOKEN}" \
		 -H "Accept: application/vnd.github.mercy-preview+json" \
		 -H "Content-Type: application/json" \
		 -d '${GIT_GITHUB_REPO_TOPICS}' \
		 https://api.github.com/repos/${GIT_GITHUB_ORG}/$$1/topics;\
        git clone ${GIT_REPO_PREFIX}/$$1.git;\
        echo -----------------------;\
        echo "GIT CLONE DONE";\
        echo "";\
	done;\
	IFS=$$OLDIFS
