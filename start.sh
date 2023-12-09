#!/bin/sh

ip addr add 
ip addr add 2620:4f:8000::6/48 dev eth0
ip addr add 2620:4f:8000::42/48 dev eth0
ip addr add 2001:4:112::1/48 dev eth0

coredns --conf=coredns