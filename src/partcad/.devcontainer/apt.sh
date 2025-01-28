#!/usr/bin/env bash

set -exuo pipefail

apt-get update

# shellcheck disable=SC2046
# TODO: Enable support for apt.txt workflow
apt-get install --yes --no-install-recommends $(cat /tmp/apt.in)

rm -rf /var/lib/apt/lists/*
