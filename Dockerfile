FROM php:7.4-fpm-alpine
LABEL maintainer="Zhihui Tang <info@xhanzi.com>"

RUN apk add --update --no-cache zlib-dev curl libpng-dev oniguruma-dev php7-gd composer npm \
    && curl --silent --show-error --fail --location --header "Accept: application/tar+gzip, application/x-gzip, application/octet-stream" -o - \
    "https://caddyserver.com/download/linux/amd64?plugins=http.expires,http.realip&license=personal" | tar --no-same-owner -C /usr/bin/ -xz caddy \
    && chmod 0755 /usr/bin/caddy

WORKDIR /xhanzi/app
VOLUME ["/xhanzi/data"]
COPY . /xhanzi/app
RUN chown -R www-data:www-data /xhanzi

RUN composer install \
    && composer update \
    && composer upgrade \
    && npm i \
    && npm audit fix \
    && npm audit fix --force

EXPOSE 80 443

CMD [ "/usr/bin/caddy", "--conf", "Caddyfile" ]
