-include ../../@bin/config/base.mk

.PHONY: help
SHELL := /bin/bash

help:
	@echo 'Available Commands:'
	@egrep '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":"}; { if ($$3 == "") { printf " - \033[36m%-18s\033[0m %s\n", $$1, $$2 } else { printf " - \033[36m%-18s\033[0m %s\n", $$2, $$3 }}'

#==============================================================#
# NOTIFICATIONS												   #
#==============================================================#
notify-success: ## Sends notification on success, TITLE, MESSAGE and SLACK_URL have to be set
	@curl -s -X POST -H 'Content-type: application/json' -d '{"blocks":[ {"type":"header", "text":{ "type":"plain_text", "text": "$(TITLE)" }}, {"type":"divider"}, {"type":"context", "elements":[ {"type":"mrkdwn", "text": ":white_check_mark: $(MESSAGE)\n." } ] } ] }' $(SLACK_URL)

notify-failure: ## Sends notification on failure, TITLE, MESSAGE and SLACK_URL have to be set
	@curl -s -X POST -H 'Content-type: application/json' -d '{"blocks":[ {"type":"header", "text":{ "type":"plain_text", "text": "$(TITLE)" }}, {"type":"divider"}, {"type":"context", "elements":[ {"type":"mrkdwn", "text": ":x: $(MESSAGE)\n." } ] } ] }' $(SLACK_URL)
