#!/bin/bash
set -e

php-fpm --nodaemonize &

exec /usr/sbin/apache2ctl -D FOREGROUND
