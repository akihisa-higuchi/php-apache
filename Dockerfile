FROM php:8-apache
COPY config/php.ini /usr/local/etc/php/

RUN a2enmod rewrite

RUN apt-get update \
	&& apt-get install -y libonig-dev

RUN docker-php-ext-install -j$(nproc) opcache

RUN pecl install apcu
