FROM roundcube/roundcubemail:latest

RUN apt-get update \
    && apt-get install -y --no-install-recommends $PHPIZE_DEPS \
    && pecl install xdebug \
    && docker-php-ext-enable xdebug \
    && rm -rf /var/lib/apt/lists/* /tmp/pear

COPY docker/xdebug.ini /usr/local/etc/php/conf.d/99-xdebug.ini