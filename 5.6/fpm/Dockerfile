FROM php:5.6-fpm

RUN apt-get update && apt-get install -y \
    zlib1g-dev \
    libicu-dev \
    libpq-dev \
    libxml2-dev \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng12-dev

RUN docker-php-ext-install mbstring \
    && docker-php-ext-install iconv \
    && docker-php-ext-install intl \
    && docker-php-ext-install pdo \
    && docker-php-ext-install pdo_mysql \
    && docker-php-ext-install pdo_pgsql \
    && docker-php-ext-install soap \
    && docker-php-ext-install exif \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install gd

RUN docker-php-ext-enable opcache
RUN pecl install xdebug

# Make sure you escape characters that may have a special
# meaning in regular expressions, like the '&' sign!
ENV ENVIRONMENT "development"
ENV TIMEZONE "Europe/Brussels"
ENV ERROR_REPORTING "E_ALL"
ENV POST_MAX_SIZE "8M"
ENV MEMORY_LIMIT "128M"
ENV XDEBUG_IDEKEY "docker-php:5.6-fpm"
ENV XDEBUG_REMOTE_PORT "9001"

RUN mkdir /config
COPY php.ini-* /config/

COPY docker-entrypoint.sh /
RUN ["chmod", "+x", "/docker-entrypoint.sh"]
ENTRYPOINT ["/docker-entrypoint.sh"]

EXPOSE 9000
CMD ["php-fpm"]
