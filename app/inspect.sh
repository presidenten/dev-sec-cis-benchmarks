#!/bin/bash

inspec exec inspec/cis-$1-benchmark $2 $3 \
  --reporter json:/share/output/$1-results.json \
  --chef-license=accept-silent \
  -t ssh://$USER@$SERVER > /dev/null 2>&1
