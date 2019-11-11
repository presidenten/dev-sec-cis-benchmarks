dev-sec-cis-benchmarks
======================

What it is
----------

This is a docker image that run the Chef Inspec versions of [CIS-benchmarks](https://www.cisecurity.org/cis-benchmarks/) from [dev-sec.io](https://dev-sec.io) with specified versions. These benchmarks are included:
- [dil (distribution independent linux)](https://github.com/dev-sec/cis-dil-benchmark)
- [docker](https://github.com/dev-sec/cis-docker-benchmark)
- [kubernetes](https://github.com/dev-sec/cis-kubernetes-benchmark)

The included benchmarks have their versions specified with git hashes. See `./config.sh` for the git hashes that are included in this version.

The output are json-files that can be consumed by [cis-benchmark-allure-reporter](https://github.com/presidenten/cis-benchmark-allure-reporter).

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
