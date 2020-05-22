#!/bin/bash -xe

# app
# ├── api
# └── deployments
#     ├── api-gems
#     └── api-release

cd /home/ubuntu/app/api/

. /home/ubuntu/.profile

#
# RSYNC: from api-release/ to api/
#
echo "$(date '+%F %T') rsyncing release folder with api folder" >> /home/ubuntu/deployment_logs/rsync.log 2>&1
rsync -arv --delete \
  --exclude "vendor/" \
  /home/ubuntu/app/deployments/api-release/ \
  /home/ubuntu/app/api/ \
  >> /home/ubuntu/deployment_logs/rsync.log 2>&1

#
# RESTART nginx
# nginx comes bundled with phussion passenger
#
sudo service nginx restart >> /home/ubuntu/deployment_logs/nginx.log 2>&1
	
truncate -s 0 log/$RAILS_ENV.log
chmod 664 log/$RAILS_ENV.log

echo "$(date '+%F %T') Changing ownership to ubuntu" >> /home/ubuntu/deployment_logs/chowning.log 2>&1
sudo chown -Rv ubuntu:ubuntu log tmp vendor >> /home/ubuntu/deployment_logs/chowning.log 2>&1
