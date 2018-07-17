#!/bin/bash
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get dist-upgrade -y
sudo apt-get install git -y
sudo apt-get install nano -y
sudo apt-get install curl -y
sudo apt-get install pwgen -y
sudo apt-get install wget -y
sudo apt-get install build-essential libtool automake autoconf -y
sudo apt-get install autotools-dev autoconf pkg-config libssl-dev -y
sudo apt-get install libgmp3-dev libevent-dev bsdmainutils libboost-all-dev -y
sudo apt-get install libzmq3-dev -y
sudo apt-get install libminiupnpc-dev -y
sudo add-apt-repository ppa:bitcoin/bitcoin -y
sudo apt-get update -y
sudo apt-get install libdb4.8-dev libdb4.8++-dev -y
cd
#get wallet files
wget https://raw.githubusercontent.com/telostia/smartcloud-guides/master/wallet/linux64/smrtc-linux.tar.gz
tar -xvf smrtc-linux.tar.gz
chmod +x smrtc*
cp smrtc* /usr/local/bin
rm smrtc*
ufw allow 9887/tcp


#masternode input

#echo -e "${GREEN}Now paste your Masternode key by using right mouse click ${NONE}";
#read MNKEY

EXTIP=`wget -qO- eth0.me`
PASSW=`pwgen -1 20 -n`

echo -e "${GREEN}Preparing config file ${NONE}";

sudo mkdir $HOME/.smrtc

printf "addnode=139.99.197.135:9887\n\nrpcuser=smartcuser\nrpcpassword=$PASSW\nrpcport=9987\nrpcallowip=127.0.0.1\ndaemon=1\nlisten=1\nserver=1\nmaxconnections=54\nexternalip=$EXTIP:9887" >  $HOME/.smrtc/smrtc.conf

smrtcd
watch smrtc-cli getinfo

