#!/bin/bash

/etc/init.d/nginx start
/etc/init.d/sshd start

while true
do
    /usr/bin/tail -f /dev/null
done
