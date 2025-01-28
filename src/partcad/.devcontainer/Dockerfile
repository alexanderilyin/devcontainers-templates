FROM mcr.microsoft.com/devcontainers/base:bookworm


ARG IMAGE_VERSION=1.1.0

# https://docs.github.com/en/packages/working-with-a-github-packages-registry/working-with-the-container-registry#labelling-container-images
# https://github.com/opencontainers/image-spec/blob/main/annotations.md
LABEL org.opencontainers.image.source "https://github.com/partcad/devcontainers-templates.git"
LABEL org.opencontainers.image.description "PartCAD: Dev Container [base:bookworm]"
LABEL org.opencontainers.image.version ${IMAGE_VERSION}
LABEL org.opencontainers.image.licenses "Apache 2.0"
LABEL org.opencontainers.image.documentation "https://partcad.readthedocs.io"

COPY --from=ghcr.io/hadolint/hadolint:v2.12.1-beta-debian /bin/hadolint /usr/local/bin/hadolint

RUN \
  --mount=type=bind,source=./apt.txt,target=/tmp/apt.txt \
  --mount=type=bind,source=./apt.sh,target=/tmp/apt.sh \
  /tmp/apt.sh

  RUN \
  --mount=type=bind,source=./bootstrap.sh,target=/tmp/bootstrap.sh \
  /tmp/bootstrap.sh
