#!/bin/sh

# Get the version of jellyfin
VERSION=latest
if [ ! $1 = "" ]; then VERSION=$1; fi

docker push tuonglan/jellyfin-nvidia-patch:$VERSION
