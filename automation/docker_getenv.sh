#!/bin/bash

# check version
if [ -z "$VERSION" ]
      then
      VERSION=`jq -r '.version' ./package.json`
      
fi

if [ -z "$NAMESPACE" ]; then
    
    NAMESPACE=$(cat ./automation/NAMESPACE)
      
fi

#get reponame
git_url=$(basename $(git config --get remote.origin.url))
REPONAME=${git_url/\.git/''}

#get BRANCH_NAME from  GIT
if [ -z $GIT_BRANCH ]; then
  BRANCH_NAME=$(git rev-parse --abbrev-ref HEAD)
else 
  BRANCH_NAME=$GIT_BRANCH
fi

# check repository
if [ -z "$REPOSITORY" ]
then
      REPOSITORY="$NAMESPACE/$REPONAME"
fi

# check registry if not present then set to gitlab ECR
if [ -z "$REGISTRY" ]
then
      REGISTRY="dockerhub.com"
fi

# check git user
if [ -z "$GITLAB_USER_LOGIN" ]
      then
            GIT_USER=`git config user.name`
      else
            GIT_USER=$GITLAB_USER_LOGIN
fi
# check git user_email
if [ -z "$GITLAB_USER_EMAIL" ]
      then
            GIT_USER_EMAIL=`git config user.email`
      else
            GIT_USER_EMAIL=$GITLAB_USER_EMAIL
fi
# echo result
echo -e "\e[1;34m
BRANCH_NAME is:\t$BRANCH_NAME 
NAMESPACE is:\t$NAMESPACE 
REGISTRY is:\t$REGISTRY 
REPOSITORY is:\t$REPOSITORY 
VERSION is:\t$VERSION 
GIT_USER is:\t$GIT_USER 
GIT_USER_EMAIL:\t$GIT_USER_EMAIL \e[0m \n\n\n"

set +x
