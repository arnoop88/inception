FROM debian:buster

RUN apt-get update && \
    apt-get install -y nginx openssl && \
    rm -rf /var/lib/apt/lists/*

COPY ./conf/default.conf /etc/nginx/conf.d
COPY ./tools/nginx.sh .
RUN chmod +x nginx.sh

EXPOSE 443

ENTRYPOINT ["/usr/local/bin/nginx.sh"]

CMD ["nginx", "-g", "daemon off;"]