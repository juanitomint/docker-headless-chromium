#!/bin/bash
# check version
source ./automation/printTable.sh
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

if [ -z "$VERSION" ]
      then
      VERSION=$BRANCH_NAME
      
fi

# check repository
if [ -z "$REPOSITORY" ]
then
      REPOSITORY="$NAMESPACE/$REPONAME"
fi

# check registry if not present then set to gitlab ECR
if [ -z "$REGISTRY" ]
then
      REGISTRY=""
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
echo -e "\e[1;34m"
printTable ',' "$(cat <<EOF
VAR,VALUE
BRANCH_NAME,$BRANCH_NAME 
NAMESPACE,$NAMESPACE 
REGISTRY,$REGISTRY 
REPOSITORY,$REPOSITORY 
VERSION,$VERSION 
GIT_USER,$GIT_USER 
GIT_USER_EMAIL,$GIT_USER_EMAIL 
EOF
)
"


echo -e "\e[0m \n\n\n"
set +x
