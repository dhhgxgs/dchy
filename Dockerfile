FROM liyuanbiao/hysteria:latest

RUN mkdir -p /etc/hysteria

RUN openssl genrsa -out /etc/hysteria/server.key 2048 && \
    openssl req -new -x509 -key /etc/hysteria/server.key -out /etc/hysteria/server.crt -days 3650 -subj "/C=US/ST=CA/L=SF/O=Hysteria/CN=hysteria"

COPY config.yaml /etc/hysteria/server.yaml

CMD ["server", "-c", "/etc/hysteria/server.yaml"]
