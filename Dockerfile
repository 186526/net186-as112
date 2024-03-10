FROM alpine

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.tuna.tsinghua.edu.cn/g' /etc/apk/repositories && \
    apk add --no-cache coredns iproute2

COPY ./coredns /etc/coredns

COPY ./start.sh /start.sh

ENTRYPOINT [ "ash", "/start.sh" ]