#! /bin/sh
echo "Closing firewall for IP Address $1"

iptables -D FORWARD -s $1 -d ! $CLIENT_NETWORK -j ACCEPT >/dev/null 2>&1
iptables -t nat -D PREROUTING -s $1 -d ! $CLIENT_NETWORK -p tcp -j ACCEPT >/dev/null 2>&1

exit 0
