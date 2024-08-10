FROM debian:buster

RUN apt-get update -y && \
    apt-get install -y --no-install-recommends vsftpd && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY --chown=root:root ./tools/ftp.sh /ftp.sh
RUN chmod +x /ftp.sh

# maybe no
EXPOSE 21

CMD ["/ftp.sh"]