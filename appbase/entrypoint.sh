#!/bin/bash

/usr/sbin/php-fpm7.4 -F -R & 
/usr/bin/supervisord -c /etc/supervisor/supervisord.conf 