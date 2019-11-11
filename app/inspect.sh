#!/bin/sh

inspec exec inspec/cis-$1-benchmark \
  --reporter json:/share/output/$1-results.json \
  --chef-license=accept-silent \
  -t ssh://$USER@$SERVER > /dev/null 2>&1
