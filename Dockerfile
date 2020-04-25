FROM php:7.4-fpm-alpine
LABEL maintainer="Zhihui Tang <info@xhanzi.com>"

WORKDIR /var/www/html

RUN apk update && apk add --no-cache shadow curl php7 php7-fpm php7-common php7-pdo php7-mcrypt php7-mbstring php7-xml php7-openssl \
    php7-json php7-phar php7-zip php7-gd php7-dom php7-session php7-zlib zlib-dev libpng-dev oniguruma-dev composer npm pcre-dev php7-dev \
    php7-sqlite3 php7-opcache php7-fileinfo && rm -rf /var/cache/apk/* && docker-php-ext-install gd opcache fileinfo \
    && docker-php-ext-enable gd fileinfo opcache

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
COPY --chown=www-data:www-data . .
RUN chmod -R 755 ./storage
USER www-data

EXPOSE 9000
CMD [ "php-fpm" ]
