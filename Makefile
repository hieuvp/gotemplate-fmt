.PHONY: fmt
fmt:
	@printf "\n"
	$(MAKEFILE_SCRIPT_PATH)/fmt-yaml.sh
	@printf "\n"

	@printf "\n"
	$(MAKEFILE_SCRIPT_PATH)/fmt-go.sh
	@printf "\n"

	@printf "\n"
	$(MAKEFILE_SCRIPT_PATH)/fmt-markdown.sh
	@printf "\n"

.PHONY: lint
lint:
	@printf "\n"
	$(MAKEFILE_SCRIPT_PATH)/lint-yaml.sh
	@printf "\n"

	@printf "\n"
	$(MAKEFILE_SCRIPT_PATH)/lint-go.sh
	@printf "\n"

.PHONY: test
test:
	@printf "\n"
	ginkgo -r
	@printf "\n"

.PHONY: test-ci
test-ci:
	@printf "\n"
	ginkgo -r \
	--randomizeAllSpecs --randomizeSuites \
	--failOnPending \
	--cover \
	--trace \
	--race \
	--progress
	@printf "\n"

.PHONY: git-add
git-add: fmt lint test
	@printf "\n"
	git add --all .
	@printf "\n"

.PHONY: clean
clean:
	@printf "\n"
	$(MAKEFILE_SCRIPT_PATH)/clean-go.sh
	@printf "\n"
