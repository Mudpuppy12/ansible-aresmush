#!/bin/sh
cd /home/ares/aresmush

bundle exec rake configure

# This will wipe the db/init
bundle exec rake init

# Database migrations (If any)
bundle exec rake initmigrations

# Webportal config, file is created during site specific configuration

sudo cp /home/ares/aresmush/install/nginx.default /etc/nginx/sites-enabled/default
sudo service nginx restart
