#!/bin/bash

username=$1
domain=$2
useradd $username -s /bin/bash -d /var/www/$domain -m
usermod -a -G www-data $username
chown -R $username:www-data "/var/www/$domain"
sudo chmod -R g+s "/var/www/$domain"
passwd $username
virtualhost create $domain $domain/httpdocs