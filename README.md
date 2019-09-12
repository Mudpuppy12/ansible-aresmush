# ansible-aresmush
Installs aresmush on an ubuntu-18.04 system using ansible playbook. 
I wanted to install ares on a virtual box, and brush up on some
ansible skills.


# Installing
Make sure you have ansible installed in your ubuntu system. 
Then run the first playbook which will install the base, 
also creating the ares user for you. Run at root on the box.
Playbook uses local connection.

<pre>
# ansible-playbook ubuntu_server-aresmush.yml
</pre>

Now run the aresmush ansible installer, as root user.

<pre>
# ansible-playbook install-aresmush.yml
</pre>

# Configure
Below will configure ares, this usually is done once. Make sure to be the
'ares' user when running these commands.
<pre>

## Become the ares user
# sudo su - ares

# Change into game directory
$ cd aresmush

# This will configure site specific things (ip, ports, etc)
$ bundle exec rake configure

# This will wipe the db/init
$ bundle exec rake init

# Database migrations (If any)
$ bundle exec rake initmigrations

# Webportal config, file is created during site specific configuration

$ sudo cp /home/ares/aresmush/install/nginx.default" /etc/nginx/sites-enabled/default
$ sudo service nginx restart
</pre>

# Start up the game!
As the ares user star up the game.

<pre>
$ cd aresmush
$ bin/startares
</pre>

# TODO:
* Like to dockerize the install of ares at some point.
* Configure all with ansible, but did not want to mess with the ruby/rake things.
* Add Vagrant file for auto provisioning for ares development/test