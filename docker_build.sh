#!/usr/bin/env bash
set -Eeuo pipefail
set -x

docker build -t "vertx-graal-repro" .

# Clean <none> images
temp=$(docker images --filter "dangling=true" -q --no-trunc) && [[ -n "$temp" ]] && { docker rmi -f $temp || true; }
