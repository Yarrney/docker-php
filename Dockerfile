FROM php:7.0-fpm

# Install sSMTP for mail support
RUN apt-get update \
    && apt-get install -y -q --no-install-recommends \
        ssmtp \
        libjpeg-dev \
        libpng-dev \
    && apt-get clean \
    && rm -r /var/lib/apt/lists/* \
    && docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr \
    && docker-php-ext-install gd mysqli opcache
