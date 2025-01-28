#!/bin/bash
cd $(dirname "$0")
source test-utils.sh

check "distro" lsb_release -c

echo "HOME: $HOME"
echo "OP_CONFIG_DIR: $OP_CONFIG_DIR"
echo "PRE_COMMIT_HOME: $PRE_COMMIT_HOME"

check "allure" [ "$(command -v allure)" ]
echo "allure version: $(allure --version)"

check "conda" [ "$(command -v conda)" ]
check "gh" [ "$(command -v gh)" ]
check "git-lfs" [ "$(command -v git-lfs)" ]
check "hadolint" [ "$(command -v hadolint)" ]
check "jq" [ "$(command -v jq)" ]

check "poetry" [ "$(command -v poetry)" ]
echo "poetry version: $(poetry --version)"

check "pre-commit" [ "$(command -v pre-commit)" ]
echo "pre-commit version: $(pre-commit --version)"

check "python" [ "$(command -v python)" ]
check "starship" [ "$(command -v starship)" ]
check "yq" [ "$(command -v yq)" ]

reportResults
