#!/bin/bash
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

echo -e "GET http://google.com HTTP/1.0\n\n" | nc google.com 80 > /dev/null 2>&1
if [ $? -eq 0 ]; then
	echo "Online"
	apt-get install openssh-server
	apt-get install vlc
	
	VER=$(lsb_release -sr)
	if [ "$VER" == "14.04" ] || [ "$VER" == "15.10" ]|| [ "$VER" == "16.04" ] ;then
                apt-get install libopus0
                apt-get install gstreamer1.0-liba
	else
		sudo apt-get install gstreamer*
	fi
	
	
else   
	echo "No Internet Connection To Install Updates"
	exit 0;
fi
