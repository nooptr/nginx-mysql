#!/bin/bash

/etc/init.d/nginx start
/etc/init.d/sshd start

/usr/bin/tail -f /dev/null
