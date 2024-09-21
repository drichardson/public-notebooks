#!/usr/bin/env bash

set -euo pipefail

PREFIX=dougs-public-notebooks
ENVIRONMENT=environment.yml
if [[ $(uname) == "Darwin" ]]; then
	ENVIRONMENT=environment-mac.yml
fi

if [[ $(command -v micromamba > /dev/null) ]]; then
    echo "Missing micromamba."
    exit 1
fi

micromamba create \
    --name $PREFIX \
    --file $ENVIRONMENT \
    --strict-channel-priority \
    --channel pytorch \
    --channel nvidia \
    --channel conda-forge \
    --log-level warning
