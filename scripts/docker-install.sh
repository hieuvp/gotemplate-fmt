#!/usr/bin/env bash

set -eou pipefail

readonly IMAGE_NAME=gotemplate-fmt
readonly DOCKERFILE_NAME=install.dockerfile

# Cleanup resources
cleanup() {
  docker system prune --force
  docker rmi --force "$IMAGE_NAME"
}

set -x

cleanup

docker build \
  --tag "$IMAGE_NAME" \
  --file "$DOCKERFILE_NAME" .

docker run --rm "$IMAGE_NAME"

cleanup

### Put this into GitHub Workflows
