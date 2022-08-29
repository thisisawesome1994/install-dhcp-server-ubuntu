<b>Install DHCP-Server on Ubuntu 22.04</b></br>
</br>
1- Update system</br>

```
sudo apt update && apt upgrade -y
```

</br>
2- Install dhcp server</br>

```
sudo apt install isc-dhcp-server -y
```

</br>
3- Backup dhcp configuration

```
sudo mv /etc/dhcp/dhcpd.conf{,.backup}
```

</br>
4- Edit configuration file

```
nano /etc/dhcp/dhcpd.conf
```

Change the file to:</br>

```
default-lease-time 600;
max-lease-time 7200;
authoritative;
 
subnet 192.168.0.0 netmask 255.255.255.0 {
 range 192.168.0.2 192.168.0.250;
 option routers 192.168.0.254;
 option domain-name-servers 192.168.0.1, 1.1.1.1;
#option domain-name "mydomain.example";
}
```

Add the following for use with static ip addresses.</br>
Change MAC address, IP address and host accordingly.</br>
</br>

```
host Laptop {
hardware ethernet e0:91:53:31:af:ab;
fixed-address 192.168.0.20;
}
```

5- Edit interfaces to use.</br>

```
nano /etc/default/isc-dhcp-server
```

and change to:

```
INTERFACESv4="eth0"
```

6- Restart dhcp server.</br>

```
systemctl restart isc-dhcp-server.service
```

Done!
