#!/bin/sh

# Get the version of jellyfin
VERSION=latest
if [ ! $1 = "" ] ; then VERSION=$1; fi
docker pull linuxserver/jellyfin:$VERSION

# Get the entry point of jellyfin
CMD="docker inspect linuxserver/jellyfin:${VERSION} | jq '.[0].ContainerConfig.Entrypoint | join(\" \")'"
ENTRYPOINT=$(eval $CMD)

# Build the container
docker build  -f Dockerfile --build-arg jellyfin_version=$VERSION --build-arg jellyfin_entrypoint=$ENTRYPOINT \
    -t tuonglan/jellyfin-nvidia-patch:$VERSION .
