.PHONY: fmt
fmt:
	@printf "\n"
	$(MAKEFILE_SCRIPT_PATH)/fmt-markdown.sh
	@printf "\n"

.PHONY: lint
lint:

.PHONY: test
test:

.PHONY: test-ci
test-ci:

.PHONY: git-add
git-add: fmt lint test
	@printf "\n"
	git add --all .
	@printf "\n"
