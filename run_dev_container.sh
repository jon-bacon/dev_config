#!/bin/sh

set -eE

docker run --rm -dit -v ${HOME}:${HOME} --name jb_dev_container_0 jb_dev_container:0.1

USERNAME=$(id -n -u)
USERID=$(id -u)
GROUPNAME=$(id -n -g)
GID=$(id -g)

docker exec jb_dev_container_0 bash -c "groupadd -g $GID $GROUPNAME"
docker exec jb_dev_container_0 bash -c "useradd -M -u $USERID -g $GID $USERNAME"

docker exec -it -u $USERNAME -w ${HOME} jb_dev_container_0 bash
