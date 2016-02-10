#!/bin/bash -e

cp /config/php.ini-$ENVIRONMENT /usr/local/etc/php/php.ini

sed -i "s|^;date.timezone =$|date.timezone = \"$TIMEZONE\"|g" /usr/local/etc/php/php.ini
sed -i "s|^error_reporting = E_ALL$|error_reporting = $ERROR_REPORTING|g" /usr/local/etc/php/php.ini
sed -i "s|^memory_limit = 128M$|memory_limit = $MEMORY_LIMIT|g" /usr/local/etc/php/php.ini

exec "$@"
