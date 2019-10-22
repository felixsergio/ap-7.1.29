FROM php:7.1.29-apache
MAINTAINER Sergio Felix <sergiofelix16@gmail.com>

RUN apt-get update
RUN apt-get install -y libpq-dev libxml2-dev openssl zip unzip git zlib1g-dev
RUN apt-get install libpng12-dev libfreetype6-dev -y
RUN docker-php-ext-install pdo pdo_pgsql pdo_mysql mysqli
RUN docker-php-ext-install soap
RUN docker-php-ext-install mbstring zip gd
RUN a2enmod rewrite

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer


# Install npm
RUN apt-get update -y && apt-get install curl -y && curl -sL https://deb.nodesource.com/setup_10.x && apt clean -y
RUN apt-get install nodejs npm -y
