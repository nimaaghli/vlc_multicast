These scripts will make ubuntu computer a multicast server that can multicast video to group of clinets on local netwrok
1-run ./install.sh to install packegs 
2-run ./config.sh <interface name> to configure you network interface for multicasting
3-run ./run <path to video> <Host Ip> <Port> to start multicasting video over UDP ,
clinets who are joind to 244.0.0.0 multicast group can receive video on their vlc clinet by setting URL to rtp://<server ip>:<port>
