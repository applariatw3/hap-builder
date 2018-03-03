#!/bin/sh
#Dynamically create the config based on container ENV_VARS

[ -n "$MCS_SVC" ]  && cat /conf/mcs.cfg >> /usr/local/etc/haproxy/haproxy.cfg
[ -n "$RM_SVC" ] && cat /conf/rm.cfg >> /usr/local/etc/haproxy/haproxy.cfg
[ -n "$DRILL_SVC" ] && cat /conf/drill.cfg >> /usr/local/etc/haproxy/haproxy.cfg
[ -n "$EDGE_SVC" ] && cat /conf/edge.cfg >> /usr/local/etc/haproxy/haproxy.cfg
[ -n "$DSR_SVC" ] && cat /conf/dsr.cfg >> /usr/local/etc/haproxy/haproxy.cfg