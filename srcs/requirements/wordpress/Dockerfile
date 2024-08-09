FROM debian:buster

RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    bash \
    php \
    php-cgi \
    php-mysql \
    php-fpm \
    php-pdo \
    php-gd \
    php-cli \
    php-mbstring \
    redis \
    php-redis && \
    rm -rf /var/lib/apt/lists/*

RUN rm -f /etc/php/7.3/fpm/pool.d/www.conf

RUN mkdir -p /run/php

COPY ./conf/wordpress.conf /etc/php/7.3/fpm/pool.d/www.conf
COPY ./tools/wordpress.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/wordpress.sh

ENTRYPOINT [ "/usr/local/bin/wordpress.sh" ]

WORKDIR /var/www/html/

EXPOSE 9000

CMD [ "php-fpm7.3", "-F" ]