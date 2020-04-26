FROM php:7.4-fpm-alpine

WORKDIR /var/www/html

RUN apk update \
    && apk add --no-cache --update php7-pdo_pgsql php7-gd \
    php7-mbstring php7-xml php7-opensslphp7-json php7-phar \
    php7-zip php7-dom php7-session php7-zlib zlib-dev \
    libpng-dev oniguruma-dev pcre-dev postgresql-dev \
    php7-opcache php7-fileinfo \
    && docker-php-ext-install pdo pdo_pgsql pgsql fileinfo opcache \
    && rm -rf /var/cache/apk/*
