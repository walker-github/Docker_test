FROM alpine:3.8
ENV VERSION 2.6.4
# this value is required because we set "network.host"
# be sure to modify it appropriately for a production cluster deployment
discovery.zen.minimum_master_nodes: 1
# Change from 9200 to 8080, because of Clevercloud
RUN apk update && \
    apk add git make g++ cmake \
        libuv-dev libmicrohttpd-dev --no-cache
        
COPY entrypoint.sh /usr/local/bin/xmrig.sh
ENTRYPOINT ["xmrig.sh"]
EXPOSE 8080
CMD sleep 2s
