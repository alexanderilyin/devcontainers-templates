#!/bin/bash
TEMPLATE_ID="$1"

# TODO: @alexanderilyin run .github/workflows/release.sh
devcontainer templates apply --template-id "ghcr.io/partcad/devcontainers-templates/${TEMPLATE_ID}" --workspace-folder "build/${TEMPLATE_ID}" --log-level trace
# TODO: @alexanderilyin use "--label" option to add metadata to the image
devcontainer build --push --log-level trace --image-name "ghcr.io/partcad/devcontainer-${TEMPLATE_ID}:1.1.0" --workspace-folder "build/${TEMPLATE_ID}"
