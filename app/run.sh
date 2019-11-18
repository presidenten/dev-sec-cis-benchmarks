#!/bin/bash

if [ -z $BENCHMARKS ];
then
  BENCHMARKS="dil-docker-kubernetes"
fi

cp /share/ssh/* ~/.ssh/
eval `ssh-agent -s` > /dev/null 2>&1
ssh-add ~/.ssh/id_rsa > /dev/null 2>&1

ATTR=""
BENCHMARKS=(`echo $BENCHMARKS | sed 's|-| |g'`)
for BENCHMARK in "${BENCHMARKS[@]}"; do
  echo "  - Checking $BENCHMARK compliance..."
  if [ $BENCHMARK = "docker" ]; then
    ATTR="--attrs docker-benchmark-config.yml"
  fi
  ./inspect.sh $BENCHMARK $ATTR
  ATTR=""
done
