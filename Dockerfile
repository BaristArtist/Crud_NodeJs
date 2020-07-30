
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