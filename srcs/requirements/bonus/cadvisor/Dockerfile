FROM debian:buster

RUN apt-get update -y && \
    apt-get install -y wget && \
    wget https://github.com/google/cadvisor/releases/download/v0.37.0/cadvisor && \
    chmod +x cadvisor && \
    apt-get remove -y wget && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

CMD ["./cadvisor"]
