#!/bin/bash

username=$1
domain=$2

# setup new user with home dir
useradd $username -s /bin/bash -d /var/www/$domain -m

# in group www-data
usermod -a -G www-data $username

# set password
passwd $username

# create virtual host
virtualhost create $domain $domain/httpdocs

# change permissions
chown -R $username:www-data "/var/www/$domain"
sudo chmod -R 755 "/var/www/$domain"
