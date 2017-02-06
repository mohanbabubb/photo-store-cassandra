# README

===========================================================================
Project: # photo-store-cassandra

Developement environment:
-------------------------
System Requirements:
512 mb ram and 1cpu machine minimum
RVM to be installed
Ruby to be installed
Passenger and  nginx to be installed
cassandra to be installed

How to install RVM:
-------------------

How to instatll Ruby:
----------------------

How to install Passenger and Nginx:
-----------------------------------

How to install Cassandra database:
----------------------------------
Installing on ubuntu 16.04:
---------------------------
sudo apt-get update
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get -y install oracle-java8-installer
java -version
echo "deb-src http://www.apache.org/dist/cassandra/debian 37x main" | sudo tee -a /etc/apt/sources.list.d/cassandra.sources.list

gpg --keyserver pgp.mit.edu --recv-keys F758CE318D77295D
gpg --export --armor F758CE318D77295D | sudo apt-key add -

Adding second key:
gpg --keyserver pgp.mit.edu --recv-keys 2B5C1B00
gpg --export --armor 2B5C1B00 | sudo apt-key add -

Adding third key:
gpg --keyserver pgp.mit.edu --recv-keys 0353B12C
gpg --export --armor 0353B12C | sudo apt-key add -

sudo apt-get install cassandra <- To install the cassandra service
sudo service cassandra status <- To know the status
sudo service cassandra start <- To start the service

sudo nodetool status  <- Connect to the cluster to check the status

Installing on mac os:
---------------------


Download this git repo:
-----------------------


Execute the bundle install
--------------------------

Database configuration on cequel.conf

Database migrate(creation on cassandra database):
  rake cequel:migrate

Optional:
If you are unfamiliar or dont want to spent time on building up the stack, download the pre-baked vagrant box from below list. So can start developing/ hosting immediately.


