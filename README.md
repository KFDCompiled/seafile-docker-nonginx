This is based largely off of Thomas Wunschel's pull request number 203 on the main seafile docker repository: 
https://patch-diff.githubusercontent.com/raw/haiwen/seafile-docker/pull/203.patch

I kept only what was necessary to build a working docker image of the most recent seafile server version, specifically:
- mysql
- memcached
- seafile server pro

This is my first docker image so don't be surprised if something doesn't work correctly.

Goal is to use this docker image with docker-compose.yml: https://gist.github.com/KFDCompiled/92f74105899fadd9fadc58bf8932af99
to have seafile accessible through reverse proxy connected via wireguard. 
