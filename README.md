ggsn-chef
=========

Chef recipes for simpy simulation

How to provision a server
=========================

 * Install Debian 7.1 on a box, and set the host and username in prepare.sh.
 * Generate a ssh key without passphrase. Save the private key as
deploy_key in this folder. Upload the public key as deploy key to the
[simulation repository](https://github.com/fmetzger/ggsn-models).
 * Run prepare.sh, entering your users password if requested.
 * SSH to the host, and run ./provision.sh, entering the hosts sudo
   password as requested. The required software is provisioned now. This
can take a while.
 * A user simpy has been added (without a password), to become the user
   sudo su simpy.
 * Enter the users home, and go to ggsn-models/simulation and run bundle
   exec rake to start the simulation.


