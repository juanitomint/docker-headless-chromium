#!/bin/bash
	
# get variables form gitlab-ci or locals
source ./automation/docker_getenv.sh
source ./automation/aws_assume_role.sh

#get token
# `aws ecr get-login `
aws ecr get-login-password | docker login --username AWS --password-stdin $REGISTRY/$REPOSITORY

docker push $REGISTRY/$REPOSITORY:$VERSION || exit 1
set +x	