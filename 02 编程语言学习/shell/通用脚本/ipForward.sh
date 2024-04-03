#!/bin/bash

sysctl net.ipv4.ip_forward=1
iptables -t nat -A POSTROUTING -o wlp3s0 -j MASQUERADE
