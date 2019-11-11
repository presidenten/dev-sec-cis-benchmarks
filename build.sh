#!/bin/sh

export VERSION=1.0.0
export NAME=sec-dev-cis-benchmarks
export REG=presidenten

DOCKER_BUILDKIT=1 docker image build --no-cache -t $NAME:${VERSION} .
docker image tag $NAME:${VERSION} $REG/$NAME:${VERSION}

docker image ls | grep `echo "$NAME"` | grep `echo "$VERSION"`
