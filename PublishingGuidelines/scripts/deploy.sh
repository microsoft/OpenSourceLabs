#!/bin/bash

# This script will deploy to a branch model following best practices defined in
# http://nvie.com/posts/a-successful-git-branching-model/
#
#################################################################################
#
# Instructions:
# 
# Copy this script to the root directory of the repository
# Please be sure the master, staging and development branch exists
# Please execute the script for help: ./deploy.sh
#
#################################################################################
#
# License information:
#
# MIT License
#
# Copyright (c) 2016 OSS Labs
# 
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
# 
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
# 
# 

VERSION_FILE='VERSION'

MASTER_BRANCH='master'
STAGING_BRANCH='staging'
DEV_BRANCH='development'

# Get parameters needed
while [[ $# -gt 1 ]]
do
key="$1"

case $key in
    -m|--message)
    MESSAGE="$2"
    shift # past argument
    ;;
    -v|--version)
    VERSION="$2"
    shift # past argument
    ;;
    *)
            # unknown option
    ;;
esac
shift # past argument or value
done

if [[ -z $MESSAGE || -z $VERSION ]]; then
  echo 'Parameters missing...'
  echo ' '
  echo '   Usage: ./deploy.sh -v "NEW_VERSION" -m "COMMENT"'
  echo '      NEW_VERSION : New version/tag for the deployment'
  echo '      COMMENT : Comment/Message for the commit of the deployment'
  exit 1
fi

# Move to development branch
git checkout $DEV_BRANCH

# Check that there are any changes to commit
if [[ `git status --porcelain` ]]; then
  # changes we continue
  echo "\nDeploying..."
else
  # no changes
  echo "\nNothing to commit, please modify something and proceed\n"
fi

# Commit changes
git add .
git commit -m "$COMMENT"

# Move to staging branch and merge development one
git checkout $STAGING_BRANCH
git merge --no-ff --no-edit $DEV_BRANCH

# Updating version file
echo $VERSION > $VERSION_FILE

# Commit changes for staging
git add .
git commit -m "Bumped version to $VERSION"

# Move to master branch and merge staging one, tagging resources
git checkout $MASTER_BRANCH
git merge --no-ff --no-edit $STAGING_BRANCH
git tag -a $VERSION -m "$COMMENT"

# Move to development branch and merge staging one
git checkout $DEV_BRANCH
git merge --no-ff --no-edit $STAGING_BRANCH

# Commit All
git push --all
git push --tags

echo "### All done ###"

# END