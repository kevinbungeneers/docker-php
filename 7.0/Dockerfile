FROM php:7.0

RUN apt-get update && apt-get install -y zlib1g-dev libicu-dev libpq-dev git

RUN docker-php-ext-install mbstring \
    && docker-php-ext-install iconv \
    && docker-php-ext-install intl \
    && docker-php-ext-install pdo \
    && docker-php-ext-install pdo_mysql \
    && docker-php-ext-install pdo_pgsql \
    && docker-php-ext-install zip

RUN pecl install xdebug-beta

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Make sure you escape characters that may have a special
# meaning in regular expressions, like the '&' sign!
ENV ENVIRONMENT "development"
ENV TIMEZONE "Europe/Brussels"
ENV ERROR_REPORTING "E_ALL"
ENV MEMORY_LIMIT "128M"
ENV XDEBUG_SERVER_NAME "www.docker-php.docker"
ENV XDEBUG_IDEKEY "docker-php:7.0"
ENV XDEBUG_REMOTE_HOST "172.17.42.1"
ENV XDEBUG_REMOTE_PORT "9001"

RUN mkdir /config
COPY php.ini-* /config/

COPY docker-entrypoint.sh /
RUN ["chmod", "+x", "/docker-entrypoint.sh"]
ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["php", "-a"]
