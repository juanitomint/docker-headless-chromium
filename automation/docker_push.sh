#!/bin/bash
# get variables form gitlab-ci or locals
source ./automation/docker_getenv.sh
set -x	

docker push $REGISTRY$REPOSITORY:$VERSION || exit 1
set +x	