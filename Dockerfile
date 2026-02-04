FROM php:8.4-apache

WORKDIR /var/www/html

RUN a2enmod rewrite

RUN apt-get update -y
# RUN apt install software-properties-common -y
# RUN add-apt-repository ppa:ondrej/php -y
RUN apt-get install -y
RUN apt-get install libzip-dev -y
RUN apt-get install zip unzip -y
RUN docker-php-ext-install zip mysqli pdo pdo_mysql
RUN apt-get install -y sudo


COPY --from=composer:latest /usr/bin/composer /usr/bin/composer