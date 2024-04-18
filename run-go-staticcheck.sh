#!/usr/bin/env bash

set -eu -o pipefail

if ! command -v staticcheck &> /dev/null ; then
    echo "staticcheck not installed or available in the PATH" >&2
    echo "go install honnef.co/go/tools/cmd/staticcheck@latest" >&2
    exit 1
fi

failed=false

if ! staticcheck ./... 2>&1
then
    failed=true
fi

if [[ $failed == "true" ]]; then
    exit 1
fi
