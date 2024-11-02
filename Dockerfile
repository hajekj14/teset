FROM alpine:3.8

LABEL maintainer="Rainist Engineering <engineering@rainist.com>"

RUN apk update && apk add tinyproxy=1.8.4-r3

COPY tinyproxy.conf /etc/tinyproxy

ENTRYPOINT ["tinyproxy"]
CMD ["-d"]