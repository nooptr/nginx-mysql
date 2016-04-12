#!/bin/bash
mkdir -p /srv/nginx/${VIRTUAL_HOST}
cd /srv/nginx/${VIRTUAL_HOST}
curl -sS https://getcomposer.org/installer | php

/usr/sbin/nginx -g "daemon off;"
/usr/sbin/php-fpm
