FROM php:8.0.2-fpm

RUN apt-get update && \
    apt-get install -y \
    curl \
    vim \
    sudo \
    nginx \
    supervisor
WORKDIR /var/www/diwali
ADD example/diwali /var/www/diwali
ADD example/default.conf /etc/nginx/conf.d/default.conf
ADD example/default.conf /etc/nginx/sites-enabled/default
ADD example/supervisord.conf /etc/supervisor/conf.d/supervisord.conf
CMD ["/usr/bin/supervisord"]

