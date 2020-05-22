#!/bin/bash -xe

# app
# ├── api
# └── deployments
#     ├── api-gems
#     └── api-release

. /home/ubuntu/.profile

cd /home/ubuntu/app/deployments/api-release

#
# PULL from GitHub Repo
# There's an SSH key configured in the server's ~/.ssh folder
# that is allowed to pull changes from the private repo.
#
git pull origin master
