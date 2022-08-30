echo 1 >> /proc/sys/net/ipv4/ip_forward
INTIF=enp4s0
EXTIF=wlp3s0
# flush rules
iptables -F FORWARD 
iptables -t nat -F
# rules
iptables -A FORWARD -i $EXTIF -o $INTIF -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -i $INTIF -o $EXTIF -j ACCEPT
iptables -A FORWARD -j REJECT --reject-with icmp-host-prohibited
iptables -t nat -A POSTROUTING -o $EXTIF -j MASQUERADE
iptables -A INPUT -i lo -j ACCEPT
iptables -A INPUT -i $EXTIF -j ACCEPT
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
# more rules if required
