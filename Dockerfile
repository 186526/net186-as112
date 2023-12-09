FROM alpine

RUN apk add --no-cache coredns iproute2 bash
COPY ./coredns /coredns
COPY ./start.sh /start.sh

ENTRYPOINT [ "bash", "/start.sh" ]