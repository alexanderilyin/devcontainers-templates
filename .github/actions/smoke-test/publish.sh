#!/bin/bash

for TEMPLATE_ID in $(find src/ -mindepth 1 -maxdepth 1 -type d -print0 | xargs --null -n1 basename); do
    devcontainer templates apply --template-id "ghcr.io/partcad/devcontainers-templates/${TEMPLATE_ID}:1.3.0" --workspace-folder "build/${TEMPLATE_ID}" --log-level trace
    # TODO: @alexanderilyin use "--label" option to add metadata to the image
    devcontainer build --push --log-level trace --image-name "ghcr.io/partcad/devcontainer-${TEMPLATE_ID}:1.3.0" --workspace-folder "build/${TEMPLATE_ID}"
done
