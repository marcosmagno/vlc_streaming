#!/bin/bash

tc qdisc del dev $1 root

tc qdisc add dev $1 root handle 1:0 htb default 40

tc class add dev $1 parent 1:0 classid 1:1 htb rate 100mbit

tc class add dev $1 parent 1:1 classid 1:10 htb rate $2kbit prio 0

iptables -t mangle -F

iptables -t mangle -A OUTPUT -o $1 -p udp --sport 20:65535 -j CLASSIFY --set-class 1:10
iptables -t mangle -A OUTPUT -o $1 -p udp --dport 20:65535 -j CLASSIFY --set-class 1:10
iptables -t mangle -A OUTPUT -o $1 -p tcp --sport 20:65535 -j CLASSIFY --set-class 1:10
iptables -t mangle -A OUTPUT -o $1 -p tcp --dport 20:65535 -j CLASSIFY --set-class 1:10

echo "Upload changed to $2 Kbps on $1"

