dev-sec-cis-benchmarks
======================

What it is
----------

This is a docker image that run the Chef Inspec versions of
- dil (distribution independent linux)
- docker
- kubernetes
[CIS-benchmarks](https://www.cisecurity.org/cis-benchmarks/) from https://dev-sec.io/ with specified versions.

Version locks are in place to make it easier to do controlled switches to new versions of CIS-benchmarks.

See `./config.sh` to see the git hashes that are included in this version.

The output is json-files that can be consumed by [cis-benchmark-allure-reporter](https://github.com/presidenten/cis-benchmark-allure-reporter).

---

How to use
----------

Run with:
```bash
export SERVER=<server-ip> export USER=<user-with-ssh-cert> \
docker container run --rm \
  -e SERVER=$SERVER -e -e USER=$USER \
  -v ~/.ssh:/share/ssh:ro \
  -v $(pwd)/output:/share/output \
  dev-sec-cis-benchmarks
```
