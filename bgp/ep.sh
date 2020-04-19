#!/bin/bash -exu

# remove any default route added by docker
/sbin/ip route del default

# uncomment this if you want to see a dump of all routes regularily
#while sleep 10; do ip r s; done &

# start bird
/usr/sbin/bird -d
