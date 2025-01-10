# Dev Containers Templates

[![CI - Test Templates](https://github.com/partcad/devcontainers-templates/actions/workflows/test-pr.yaml/badge.svg)](https://github.com/partcad/devcontainers-templates/actions/workflows/test-pr.yaml)

## Packages

- <https://github.com/orgs/partcad/packages?repo_name=devcontainers-templates>

## Adding Templates to the Index

Next you will need to add your Templates collection to our [public index](https://containers.dev/templates) so that other community members can find them. Just follow these steps once per collection you create:

- Go to [github.com/devcontainers/devcontainers.github.io](https://github.com/devcontainers/devcontainers.github.io)
  - This is the GitHub repo backing the [containers.dev](https://containers.dev/) spec site
- Open a PR to modify the [collection-index.yml](https://github.com/devcontainers/devcontainers.github.io/blob/gh-pages/_data/collection-index.yml) file

This index is from where [supporting tools](https://containers.dev/supporting) like [VS Code Dev Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers) and [GitHub Codespaces](https://github.com/templates/codespaces) surface Templates for their Dev Container Creation Configuration UI.

## Base Development Container Images

- <https://mcr.microsoft.com/en-us/artifact/mar/devcontainers/base/tags>

## Locking Features

```bash
find src/ -mindepth 1 -maxdepth 1 -type d | xargs -n1 devcontainer upgrade --workspace-folder
```

## Pre-building Images

### Unobtainium

- <https://github.com/partcad/devcontainers-templates/pkgs/container/devcontainers-templates%2Fubik>

```bash
devcontainer templates apply --template-id  ghcr.io/partcad/devcontainers-templates/ubik --workspace-folder tmp --log-level debug
devcontainer build --push --log-level debug --image-name test --label test --workspace-folder ./tmp/
```

### PartCAD

```bash
devcontainer templates apply --template-id  ghcr.io/partcad/devcontainers-templates/partcad --workspace-folder build/partcad --log-level trace
devcontainer build --push --log-level debug --image-name ghcr.io/partcad/devcontainer-partcad:latest --workspace-folder build/partcad # --label test
```

```bash
    ./.github/actions/smoke-test/build.sh partcad
    ./.github/actions/smoke-test/test.sh partcad
```

## TODO

Add <https://github.com/devcontainers/template-starter?tab=readme-ov-file#dev-container-templates-self-authoring-guide>
