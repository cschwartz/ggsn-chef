ggsn-chef
=========

Chef recipes for simpy simulation

How to provision a server
=========================

This describes the installation of a simulation node (hereafter: *HOST*) from a workstation (hereafter: *WORKSTATION*)

 * Install Debian 7.1 on a node, and note the hostname *HOST* and the number of
   cpus/cores, as well as the default user name *USER*
 * On the *WORKSTATION*: Clone this repository. Generate a ssh key without passphrase. Save the private key as
deploy_key in this folder. Upload the public key as deploy key to the
[simulation repository](https://github.com/fmetzger/ggsn-simulation).
 * On the *HOST* (if not already set up) : Install sudo and use visudo to *USER*
   sudo permissions. 
 * On the *WORKSTATION*: run ```ssh-copy-id USER@HOST``` and ```scp deploy_key USER@HOST:/tmp/```
 * On the *HOST*: run ```wget -qO- https://raw.github.com/cschwartz/ggsn-chef/master/provision.sh | bash``` and enter the *USER*s password
   as requested. The required software is provisioned now. This can take a while.
 * On the *HOST*: A user simpy has been added (without a password), to become the user
   ```sudo su simpy -l```.
 * On the *HOST*: Go to ```~/ggsn-simulation-study``` and run ```bundle exec simcontrol simulate SCENARIO``` were scenario is one of the SCENARIO.rb files
existing in ```~/ggsn-simulation/scenarios``` (best in a tmux).
