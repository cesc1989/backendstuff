#!/bin/bash -xe

# app
# ├── api
# └── deployments
#     ├── api-gems
#     └── api-release

set -e

#
# CLEAN CURRENT APP
#
# No longer necessary as the scripts now use RSync.
#
# bash /home/ubuntu/app/deployments/api-release/scripts/before_deploy.sh

#
# PULL Repo from GitHub
#
bash /home/ubuntu/app/deployments/api-release/scripts/pull_repo.sh

#
# RUN bundle, symlink bundled gems to api/vendor, assets:precompile,
#  migrations, symlink nginx.$RAILS_ENV.conf
#
bash /home/ubuntu/app/deployments/api-release/scripts/after_deploy.sh

#
# SYNC api-release with api folder
#
bash /home/ubuntu/app/deployments/api-release/scripts/application_start.sh
