ggsn-chef
=========

Chef recipes for simpy simulation

How to provision a server
=========================

 * Install Debian 7.1 on a box, and note the hostname *HOST* and the number of
   cpus/cores, as well as the default user name *USER*
 * Generate a ssh key without passphrase. Save the private key as
deploy_key in this folder. Upload the public key as deploy key to the
[simulation repository](https://github.com/fmetzger/ggsn-simulation).
 * *If required:* Install sudo and use visudo to *USER*
   sudo permissions. 
 * run ```ssh-copy-id USER@HOST``` and ```scp deploy_key USER@HOST:/tmp/
 * ssh to HOST using ```ssh USER@HOST``` and run ```wget -qO-
   https://raw.github.com/cschwartz/ggsn-chef/master/provision.sh |
bash``` and enter the *USER*s password
   password as requested. The required software is provisioned now. This
can take a while.
 * A user simpy has been added (without a password), to become the user
   ```sudo su simpy -l```.
 * Go to ggsn-simulation study and run ```bundle exec simcontrol
   simulate SCENARIO``` were scenario is one of the SCENARIO.rb files
existing in ggsn-simulation/scenarios (best in a tmux)


