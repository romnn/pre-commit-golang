#!/usr/bin/env bash

set -eu -o pipefail

if ! command -v golangci-lint &> /dev/null ; then
    echo "golangci-lint not installed or available in the PATH" >&2
    echo "git install github.com/golangci/golangci-lint@latest" >&2
    exit 1
fi

exec golangci-lint run "$@"
