#!/bin/sh

set -eE

USERNAME=$(id -n -u)
USERID=$(id -u)
GROUPNAME=$(id -n -g)
GID=$(id -g)

CONTAINER_NAME=jb_dev_container_0

if [ $(docker container inspect -f '{{.State.Running}}' $CONTAINER_NAME 2>&1) != "true" ]; then
  docker run --rm -dit -v ${HOME}:${HOME} --name $CONTAINER_NAME jb_dev_container:0.1

  docker exec $CONTAINER_NAME bash -c "groupadd -g $GID $GROUPNAME"
  docker exec $CONTAINER_NAME bash -c "useradd -M -u $USERID -g $GID $USERNAME"
fi

docker exec -it -u $USERNAME -w ${HOME} $CONTAINER_NAME bash
