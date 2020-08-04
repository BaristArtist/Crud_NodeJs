
ARG PHP_VERSION=8.0
ARG NODE_VERSION=13
ARG NGINX_VERSION=1.21

##################################################
#                     PHP                        #
##################################################
FROM php:${PHP_VERSION}-fpm-alpine AS sylius_temporarily_out_of_stock_plugin_php

# persistent / runtime deps
RUN apk add --no-cache \
                acl \
                bash \
                file \
                gettext \
                git \
                gnupg \
                mariadb-client \
                openssh-client \
                libxml2 \
                libuuid \
                bind-tools \
                jq \
                py3-pip \
        ;

ARG XDEBUG_VERSION=3.0.4

RUN set -eux; \
        apk add --no-cache --virtual .build-deps \
                $PHPIZE_DEPS \
                coreutils \
                freetype-dev \
                icu-dev \
                libjpeg-turbo-dev \
                libpng-dev \
                libtool \
                libwebp-dev \
                libzip-dev \
                mariadb-dev \
                zlib-dev \
                libxml2-dev \
                util-linux-dev \
        ; \
        \
        docker-php-ext-configure gd --with-jpeg --with-webp --with-freetype; \
        docker-php-ext-configure zip --with-zip; \
        docker-php-ext-install -j$(nproc) \
                exif \
                gd \
                intl \
                pdo_mysql \
                zip \
                bcmath \
                sockets \
                soap \
        ; \
        pecl install xdebug-${XDEBUG_VERSION}; \
        pecl clear-cache; \
        docker-php-ext-enable \
                xdebug \
        ; \
        \
        runDeps="$( \
                scanelf --needed --nobanner --format '%n#p' --recursive /usr/local/lib/php/extensions \
                        | tr ',' '\n' \
                        | sort -u \
                        | awk 'system("[ -e /usr/local/lib/" $1 " ]") == 0 { next } { print "so:" $1 }' \
        )"; \
        apk add --no-cache --virtual .sylius-phpexts-rundeps $runDeps; \
        \
        apk del .build-deps

COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

RUN set -eux; \
    wget -O phive.phar https://phar.io/releases/phive.phar; \