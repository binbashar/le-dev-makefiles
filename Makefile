include ./ansible/ansible.mk
include ./circleci/circleci.mk
include ./git/git.mk
include ./github/github.mk

include ./kops/kops.mk
include ./kops/kops-extras.mk
include ./kubectl/kubectl13.mk
include ./kubectl/kubectl14.mk

include ./release-mgmt/release.mk

include ./terraform11/terraform11.mk
include ./terraform11/terraform11-subfolder.mk

include ./terraform12/terraform12.mk
include ./terraform12/terraform12-import-rm.mk
include ./terraform12/terraform12-mfa.mk
include ./terraform12/terraform12-no-warn.mk
include ./terraform12/terraform12-root-context.mk
include ./terraform12/terraform12-subfolder.mk

include ./terraform13/terraform13.mk
include ./terraform13/terraform13-import-rm.mk

help:
	@echo 'Available Commands:'
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf " - \033[36m%-18s\033[0m %s\n", $$1, $$2}'
