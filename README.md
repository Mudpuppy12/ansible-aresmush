# ansible-aresmush
Installs aresmush on an ubuntu-18.04 system using ansible
scripts.

# Installing
Make sure you have ansible installed in your ubuntu system. 
Then run the first playbook which will install the base, 
and also creating the ares user for you. Run at root.

<pre>
# ansible-playbook ubuntu_server-aresush.yml
</pre>

Now run the aresmush installer, as root user

<pre>
# ansible-playbook install-aresmush.yml
</pre>

# Configure
Below will configure ares, this usually is done once
<pre>

## Become the ares user
# sudo su - ares

# Change into game directory

$ cd aresmush

# This will configure site specific things
$ bundle exec rake configure

# This will wipe the db/init
$ bundle exec rake init

# Database migrations
$ bundle exec rake initmigrations

# Webportal config, file is created during site specific configuration

$ sudo cp /home/ares/aresmush/install/nginx.default" /etc/nginx/sites-enabled/default
$ sudo service nginx restart
</pre>

# Start up the game!
<pre>
$ cd aresmush
$ bin/startares
</pre>