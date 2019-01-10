FROM php:7.2-fpm

RUN apt-get update && \
   apt-get install -y --no-install-recommends apt-utils && \
    apt-get upgrade -y && \
    apt-get install -y git && \
    apt-get install -y gnupg && \
    apt-get install -y zlib1g-dev \
    && rm -rf /var/lib/apt/lists/* \
    && docker-php-ext-install zip

RUN curl -s http://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer

RUN curl -sL https://deb.nodesource.com/setup_9.x | bash && \
  apt-get -y install nodejs