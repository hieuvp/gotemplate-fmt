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
	ginkgo -r

.PHONY: test-ci
test-ci:
	ginkgo -r --randomizeAllSpecs --randomizeSuites --failOnPending --cover --trace --race --progress
	ginkgo -r --randomizeAllSpecs --randomizeSuites --failOnPending --cover --trace --race --compilers=2

# -r will recursively find and run all spec suites in the current directory
# --randomizeAllSpecs and --randomizeSuites will shuffle both the order in which specs within a suite run, and the order in which different suites run. This can be great for identifying test pollution. You can always rerun a given ordering later by passing the --seed flag a matching seed.
# --failOnPending causes the test suite to fail if there are any pending tests (typically these should not be committed but should signify work in progress).
# --cover generates .coverprofiles and coverage statistics for each test suite.
# --trace prints out a full stack trace when failures occur. This makes debugging based on CI logs easier.
# --race runs the tests with the race detector turned on.
# --progress emits test progress to the GinkgoWriter. Makes identifying where failures occur a little easier.

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
