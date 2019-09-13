# ansible-aresmush
Ansible plays to install aresmush in a Virtual Box and Vagrant.

# Install

Make sure you have installed on your host pc:

* [Oracle Virtual Box](https://www.virtualbox.org)
* [HasiCorp Vagrant](https://www.vagrantup.com)


Clone this repo to your host and run the following command from the directory you downloaded
the repo.

<pre>
$ vagrant up
</pre>

Then follow the directions under configuing ares.

# Vagrant
Vagrant will create the virtual box machine and auto-configure the installation of ares. It
will take some time when the playbooks run and complete. Go get a soda.

# Configuring ares
Once vagrant is finished, ssh into the virtal machine and run the setup command as the ares
user

<pre>
vagrant ssh

# Then when inside the virutal machine your the vagrant user, become ares

vagrant@aresmush:~$ sudo su - ares

# As the ares user run setup script

ares@aresmush:~$ cd /vagrant/
ares@aresmush:~$ ./setup
</pre>

Answer the questions for the configuration scripts. Use 192.168.100.199 for your hostname. 
All the rest of the questions can be default.

# Start up the game server
Once configured start up the game simply with the following commands:

<pre>
ares@aresmush:~$ cd /home/ares/aresmush
ares@aresmush:~$ bin/startares
</pre>

You should now be able to access your test server/web from your host machine using 
http://localhost:8080 to get to the web portal and game by telnet 127.0.0.1 4201