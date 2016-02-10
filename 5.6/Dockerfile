FROM php:5.6

RUN apt-get update && apt-get install -y zlib1g-dev libicu-dev libpq-dev

RUN docker-php-ext-install mbstring \
    && docker-php-ext-install iconv \
    && docker-php-ext-install intl \
    && docker-php-ext-install pdo \
    && docker-php-ext-install pdo_mysql \
    && docker-php-ext-install pdo_pgsql

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Make sure you escape characters that may have a special
# meaning in regular expressions, like the '&' sign!
ENV ENVIRONMENT "development"
ENV TIMEZONE "Europe/Brussels"
ENV ERROR_REPORTING "E_ALL"
ENV MEMORY_LIMIT "128M"

RUN mkdir /config
COPY php.ini-* /config/

COPY docker-entrypoint.sh /
RUN ["chmod", "+x", "/docker-entrypoint.sh"]
ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["php", "-a"]
