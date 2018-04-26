FROM kong:latest
RUN apk add --update curl
RUN mkdir -p /root/kong-forward-proxy
COPY . /root/kong-forward-proxy/
RUN cd /root/kong-forward-proxy && luarocks make