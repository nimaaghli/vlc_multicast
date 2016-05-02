#!/bin/bash
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi
if ["$1" -eq ""];then
	echo  You Must Give Your interface name to be configured
	echo Here are the list of your interfaces pick one and try config.sh again
	ifconfig
	exit
else
if [ ! -f /etc/network/interfaces.bak ]; then
    echo "Creating Backup File at /etc/network/interfaces.bak"
    cp /etc/network/interfaces /etc/network/interfaces.bak
fi

echo  "         
auto $1
iface $1 inet static
        address 192.168.0.1
        netmask 255.255.255.0
        network 192.168.0.0
        broadcast 192.168.0.255
        dns-nameservers 4.2.2.1


	# after this NIC is up, add multicast subnets to default across eth1
        post-up route add -net 224.0.0.0 netmask 240.0.0.0 dev $1
	# after this NIC is up, enable multicasting for eth 1
        post-up ifconfig $1 multicast" >>/etc/network/interfaces
	
fi
