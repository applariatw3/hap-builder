#!/bin/sh
# MAPR demo haproxy entrypoint.sh

# Write global.cfg to haproxy.cfg
[ -f /conf/global.cfg ] && cat /conf/global.cfg > /usr/local/etc/haproxy/haproxy.cfg
[ -f /conf/haproxy.cfg ] && cat /conf/haproxy.cfg > /usr/local/etc/haproxy/haproxy.cfg

# Enhance config with create_config.sh
if [ -f /conf/create_config.sh ]; then
    chmod +x /conf/create_config.sh
    /bin/sh -c /conf/create_config.sh
fi

#Wait for other services to be ready
#TO DO: Improve to check for svc availability
sleep 30

if [ "$1" = 'haproxy' ]; then
	shift # "haproxy"
	# if the user wants "haproxy", let's add a couple useful flags
	#   -W  -- "master-worker mode" (similar to the old "haproxy-systemd-wrapper"; allows for reload via "SIGUSR2")
	#   -db -- disables background mode
	set -- haproxy -W -db "$@"
fi

exec "$@"
