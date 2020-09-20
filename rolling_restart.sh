#!/bin/bash
set -e
#  SIGNAL=1 bash -x rolling_restart.sh

PREVIOUS_CONTAINER=$(docker ps --format "{{.ID}}" --filter "name=commands")
if [ "$(echo  "${PREVIOUS_CONTAINER}" | wc -l )"  != "1" ] ; then
  echo not only one running
  exit 1
fi
WAIT_TO_START=1 docker-compose up -d --no-deps --scale commands=2 --no-recreate commands
while  [ "$( docker ps --format "{{.ID}}" --filter "name=commands" --filter "health=healthy" | wc -l)" != "2" ]; do
  sleep 2
done

if [ -n "${SIGNAL}" ] ; then
  docker kill --signal="SIGINT" $PREVIOUS_CONTAINER

  while  [ "$( docker ps --format "{{.ID}}" --filter "name=commands" | wc -l)" == "2" ]; do
    sleep 2
  done
fi

docker rm -f $PREVIOUS_CONTAINER
docker-compose up -d --no-deps --scale commands=1 --no-recreate commands
