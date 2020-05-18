# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Standard
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.PHONY: fmt
fmt:
	@printf "\n"
	$(MAKEFILE_SCRIPT_PATH)/fmt-yaml.sh
	@printf "\n"

	@printf "\n"
	$(MAKEFILE_SCRIPT_PATH)/fmt-shell.sh
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
	$(MAKEFILE_SCRIPT_PATH)/lint-shell.sh
	@printf "\n"

	@printf "\n"
	$(MAKEFILE_SCRIPT_PATH)/lint-go.sh
	@printf "\n"

.PHONY: test
test:
	@printf "\n"
	ginkgo -r --progress
	@printf "\n"

.PHONY: test-ci
test-ci:
	@printf "\n"
	ginkgo -r --progress \
	--randomizeAllSpecs --randomizeSuites \
	--failOnPending \
	--cover \
	--trace \
	--race
	@printf "\n"


# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Git
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.PHONY: git-add
git-add: fmt lint test
	@printf "\n"
	git add --all .
	@printf "\n"


# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Utils
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.PHONY: clean-install
clean-install:
	@printf "\n"
	scripts/clean-install.sh
	@printf "\n"
