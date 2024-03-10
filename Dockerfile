FROM alpine

RUN apk add --no-cache coredns iproute2

COPY ./coredns /etc/coredns

COPY ./start.sh /start.sh

ENTRYPOINT [ "ash", "/start.sh" ]