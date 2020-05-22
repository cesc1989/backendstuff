#!/bin/bash -xe

# app
# ├── api
# └── deployments
#     ├── api-gems
#     └── api-release

. /home/ubuntu/.profile

#
# DEPLOY in release folder
#
cd /home/ubuntu/app/deployments/api-release

#
# INSTALL gems
#
echo "$(date '+%F %T') Installing deployment gems" >> /home/ubuntu/deployment_logs/bundle.log 2>&1
/home/ubuntu/.rvm/bin/rvm default do bundle install --deployment \
  --without development test \
  --path /home/ubuntu/app/deployments/api-gems/bundle \
  >> /home/ubuntu/deployment_logs/bundle.log 2>&1

#
# SYMLINK api-gems to api/vendor/bundle
#
echo "$(date '+%F %T') Symlink api-gems to vendor/bundle" >> /home/ubuntu/deployment_logs/bundle.log 2>&1
ln -fsv /home/ubuntu/app/deployments/api-gems/bundle /home/ubuntu/app/api/vendor/ >> /home/ubuntu/deployment_logs/bundle.log 2>&1

#
# COMPILE assets
#
echo "$(date '+%F %T') Compiling assets" >> /home/ubuntu/deployment_logs/assets.log 2>&1
/home/ubuntu/.rvm/bin/rvm default do bundle exec rake assets:precompile >> /home/ubuntu/deployment_logs/assets.log 2>&1

#
# Run migrations
#
echo "$(date '+%F %T') Running migrations" >> /home/ubuntu/deployment_logs/migration.log 2>&1
/home/ubuntu/.rvm/bin/rvm default do bundle exec rake db:migrate RAILS_ENV=$RAILS_ENV >> /home/ubuntu/deployment_logs/migration.log 2>&1

#
# SYMLINK nginx configuration file to /etc/nginx/sites-enabled
#
echo "$(date '+%F %T') Symlinking nginx configuration file" >> /home/ubuntu/deployment_logs/symlinking.log 2>&1
sudo ln -fs /home/ubuntu/app/api/config/nginx.$RAILS_ENV.conf /etc/nginx/sites-enabled/
