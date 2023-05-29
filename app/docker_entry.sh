#!/bin/bash

chown -R www-data:www-data /app
service php7.3-fpm start
#nginx -g 'daemon off;'
service nginx start
mysqld --user=mysql
