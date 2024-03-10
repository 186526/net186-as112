#!/bin/sh

addAS112IP() {
    set -e
    ip addr add 2620:4f:8000::6/48 dev eth0
    ip addr add 2620:4f:8000::42/48 dev eth0
    ip addr add 2001:4:112::1/48 dev eth0

    ip addr add 192.175.48.6/24 dev eth0
    ip addr add 192.175.48.42/24 dev eth0
    ip addr add 192.31.196.1/24 dev eth0
}

addAS112IP || echo "add AS112 IP failed"

[ -z "$INFO" ] && export INFO="github.com/186526/net186-as112, container, localhost."

[ -z "$NOC_INFO" ] && export NOC_INFO="container.as112.localhost. noc.localhost."

sed -i "s~%INFO~${INFO}~g" /etc/coredns/db.hostname
sed -i "s~%NOC~${NOC_INFO}~g" /etc/coredns/db.hostname

coredns --conf=/etc/coredns/Corefile
