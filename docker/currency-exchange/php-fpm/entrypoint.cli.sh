#!/bin/bash

sudo chown oem:oem /var/www

ssh-keyscan github.com >> ~/.ssh/known_hosts
git clone git@github.com:AbrinteskoEV/currency-exchange.git/ .

composer install
php-fpm -D
sudo crond -f -l 8
sleep infinity
