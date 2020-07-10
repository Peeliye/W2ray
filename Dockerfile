FROM debian:10
RUN apt-get update
RUN apt-get install -y curl
RUN curl https://getcaddy.com | bash -s personal
RUN curl -L https://install.direct/go.sh | bash
RUN apt-get clean
ADD ./v2ray /v2ray
ADD ./caddy /caddy
ENV ACME_AGREE="true"
ENV PATH /usr/bin/v2ray:$PATH
EXPOSE 80 443
CMD ["v2ray", "-config=/v2ray/config.json"]
CMD ["caddy", "--conf", "/caddy/Caddyfile", "--agree=true"]
