FROM mcr.microsoft.com/devcontainers/base:bookworm


ARG IMAGE_VERSION=1.2.0

# https://docs.github.com/en/packages/working-with-a-github-packages-registry/working-with-the-container-registry#labelling-container-images
# https://github.com/opencontainers/image-spec/blob/main/annotations.md
LABEL org.opencontainers.image.source "https://github.com/partcad/devcontainers-templates.git"
LABEL org.opencontainers.image.description "PartCAD: Dev Container [base:bookworm]"
LABEL org.opencontainers.image.version ${IMAGE_VERSION}
LABEL org.opencontainers.image.licenses "Apache 2.0"
LABEL org.opencontainers.image.documentation "https://partcad.readthedocs.io"

COPY --from=ghcr.io/hadolint/hadolint:v2.12.1-beta-debian /bin/hadolint /usr/local/bin/hadolint

# TODO: Enable support for apt.txt workflow
RUN \
  --mount=type=bind,source=./apt.in,target=/tmp/apt.in \
  --mount=type=bind,source=./apt.sh,target=/tmp/apt.sh \
  /tmp/apt.sh

  RUN \
  --mount=type=bind,source=./bootstrap.sh,target=/tmp/bootstrap.sh \
  /tmp/bootstrap.sh

# TODO: @alexanderilyin: Move JIRA CLI installation to Dev Container Templates
# hadolint ignore=DL3007
COPY --from=ghcr.io/ankitpokhrel/jira-cli:latest /bin/jira /usr/local/bin/jira

# TODO: @alexanderilyin: error libmamba Could not open lockfile '/home/vscode/miniforge3/pkgs/cache/cache.lock' \
# TODO: @alexanderilyin: Run `mamba init`
# hadolint ignore=DL3004
RUN \
  curl -L -O "https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-$(uname)-$(uname -m).sh" \
  && sudo -u vscode bash "Miniforge3-$(uname)-$(uname -m).sh" -b -p /home/vscode/miniforge3

# hadolint ignore=DL3004
RUN \
  sudo apt-get update \
  && sudo apt-get install --yes moreutils \
  && sudo rm -rf /var/lib/apt/lists/*
