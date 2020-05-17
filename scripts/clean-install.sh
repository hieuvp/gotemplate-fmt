#!/usr/bin/env bash

set -eoux pipefail

rm -rf go.sum
go mod tidy
go mod verify

go install ./cmd/gotemplate-fmt
