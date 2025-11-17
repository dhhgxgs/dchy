# 修正后的 Dockerfile
FROM liyuanbiao/hysteria:latest

RUN mkdir -p /etc/hysteria

# 修正了这一行：
# 1. 合并为一行
# 2. 确保 && 后面是单个普通空格
RUN openssl genrsa -out /etc/hysteria/server.key 2048 && openssl req -new -x509 -key /etc/hysteria/server.key -out /etc/hysteria/server.crt -days 3650 -subj "/C=US/ST=CA/L=SF/O=Hysteria/CN=hysteria"

COPY config.yaml /etc/hysteria/server.yaml

CMD ["server", "-c", "/etc/hysteria/server.yaml"]
