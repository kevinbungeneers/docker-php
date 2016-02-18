#!/bin/bash -e

cp /config/php.ini-$ENVIRONMENT /usr/local/etc/php/php.ini

if [[ "$ENVIRONMENT" == 'development' ]]; then
    docker-php-ext-enable xdebug
    export PHP_IDE_CONFIG="serverName=$XDEBUG_SERVER_NAME"
    #export XDEBUG_CONFIG="remote_enable=1 remote_mode=req remote_port=9001 remote_host=172.17.42.1 remote_connect_back=0"

    sed -i "s|^xdebug.idekey=\"docker-php:7.0-fpm\"$|xdebug.idekey=\"$XDEBUG_IDEKEY\"|g" /usr/local/etc/php/php.ini
    sed -i "s|^xdebug.remote_port=9001$|xdebug.remote_port=$XDEBUG_REMOTE_PORT|g" /usr/local/etc/php/php.ini
fi


sed -i "s|^;date.timezone =$|date.timezone = \"$TIMEZONE\"|g" /usr/local/etc/php/php.ini
sed -i "s|^error_reporting = E_ALL$|error_reporting = $ERROR_REPORTING|g" /usr/local/etc/php/php.ini
sed -i "s|^memory_limit = 128M$|memory_limit = $MEMORY_LIMIT|g" /usr/local/etc/php/php.ini

exec "$@"
