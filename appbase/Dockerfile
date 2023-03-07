FROM node:16.13-slim as node
FROM mig:debian11.1

MAINTAINER itmig@molindointigas.co.id

# install php
RUN apt-get update && apt-get install -y --no-install-recommends --no-install-suggests \
    php \
    php-fpm \
    php-bcmath \
    php-curl \
    php-dom \
    php-gd \
    php-mbstring \
    php-mysqli \
    php-xml \
    php-soap \
    php-xsl \
    php-zip \
    php-bz2 \
    php-intl \
    php-imagick

# setup php working folder
RUN mv /etc/php/7.4/fpm/pool.d/www.conf /etc/php/7.4/fpm/pool.d/www.conf.default
COPY ./php-fpm/www.conf /etc/php/7.4/fpm/pool.d/www.conf
COPY ./php-fpm/10-phpini-overrides.ini /etc/php/7.4/cli/conf.d/
COPY ./php-fpm/10-phpini-overrides.ini /etc/php/7.4/fpm/conf.d/ 
RUN mkdir -p /var/run/php && chmod 755 /var/run/php && chown www-data:www-data /var/run/php
RUN mkdir -p /var/www/html && chown www-data:www-data /var/www/html && chmod 777 /var/www/html
RUN chmod 777 /etc/php/7.4/cli/conf.d/10-phpini-overrides.ini && chmod 777 /etc/php/7.4/fpm/conf.d/10-phpini-overrides.ini

# install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# install node
COPY --from=node /usr/local/lib/node_modules /usr/local/lib/node_modules
COPY --from=node /usr/local/bin/node /usr/local/bin/node
RUN ln -s /usr/local/lib/node_modules/npm/bin/npm-cli.js /usr/local/bin/npm

# install cron & supervisor
RUN apt-get install --no-install-recommends --no-install-suggests -y supervisor cron
ADD ./supervisor/supervisord.conf /etc/supervisor/
# ADD ./supervisor/services /etc/supervisor/conf.d/

# clear apt cache
RUN apt-get clean -y && apt-get autoclean -y && apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/* /var/lib/log/* /tmp/* /var/tmp/*

WORKDIR /var/www/html

EXPOSE 9000/tcp

COPY entrypoint.sh /usr/local/share/entrypoint.sh
RUN ["chmod", "+x", "/usr/local/share/entrypoint.sh"]
ENTRYPOINT ["/usr/local/share/entrypoint.sh"]
# ENTRYPOINT ["/usr/sbin/php-fpm7.4", "-F", "-R"]