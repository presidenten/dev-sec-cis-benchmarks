#!/bin/bash

source config.sh

rm -rf inspec
mkdir inspec
git clone https://github.com/dev-sec/cis-kubernetes-benchmark inspec/cis-kubernetes-benchmark
git clone https://github.com/dev-sec/cis-docker-benchmark inspec/cis-docker-benchmark
git clone https://github.com/dev-sec/cis-dil-benchmark inspec/cis-dil-benchmark

pushd inspec/cis-kubernetes-benchmark
git pull origin master
git checkout $KUBERNETES_HASH
popd
pushd inspec/cis-docker-benchmark
git pull origin master
git checkout $DOCKER_HASH
popd
pushd inspec/cis-dil-benchmark
git pull origin master
git checkout $DIL_HASH
popd

find inspec -name ".git" -type d -print0 | xargs -0 /bin/rm -rf
find inspec -name ".github" -type d -print0 | xargs -0 /bin/rm -rf
