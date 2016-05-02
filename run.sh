#!/bin/bash
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
if [ "$#" -ne 3 ]
then
  echo "Not Enough Parameters"
  echo "Usage ./run.sh <path to video file> <Ip Adress of host> <Port>"
  exit 1
fi
vlc -vvv $1 --sout '#rtp{proto=udp,mux=ts,name=big,dst=$2,port=$3}' --sout-keep --ttl 5 --loop	
else
	echo  "Dont Run run.sh as root "
fi
