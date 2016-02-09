FROM php:7.0

RUN apt-get update && apt-get install -y zlib1g-dev libicu-dev libpq-dev

RUN docker-php-ext-install mbstring \
    && docker-php-ext-install iconv \
    && docker-php-ext-install intl \
    && docker-php-ext-install pdo \
    && docker-php-ext-install pdo_mysql \
    && docker-php-ext-install pdo_pgsql

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
