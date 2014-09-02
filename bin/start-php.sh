#!/usr/bin/env bash
set -eu # exit on error or undefined variable

# Defaults
export PHP_MAX_CHILDREN=${PHP_MAX_CHILDREN:-"24"}
export PHP_START_SERVERS=${PHP_START_SERVERS:-"10"}
export PHP_MIN_SPARE_SERVERS=${PHP_MIN_SPARE_SERVERS:-"8"}
export PHP_MAX_SPARE_SERVERS=${PHP_MAX_SPARE_SERVERS:-"12"}
export PHP_MAX_REQUESTS=${PHP_MAX_REQUESTS:-"200"}

# Config file template from environment variables
#envsubst < /etc/php5/fpm/php.ini.tpl > /etc/php5/fpm/php.ini
#envsubst < /etc/php5/fpm/php-fpm.conf.tpl > /etc/php5/fpm/php-fpm.conf
envsubst < /etc/php5/fpm/pool.d/www.conf.tpl > /etc/php5/fpm/pool.d/www.conf

mkdir -p /var/log/php

# Launch
exec /usr/sbin/php5-fpm --nodaemonize $@
