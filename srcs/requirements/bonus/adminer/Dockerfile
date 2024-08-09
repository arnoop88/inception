FROM debian:buster

RUN apt-get update && \
    apt-get install -y wget php php-mysql && \
    rm -rf /var/lib/apt/lists/*

COPY ./tools/adminer.sh /adminer.sh

RUN chmod +x adminer.sh

CMD ["/adminer.sh"]