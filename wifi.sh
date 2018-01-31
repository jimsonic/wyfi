#!/bin/bash
# wlan adapter
function_name () {
   echo "Parameter #1 is $1"
   echo "Parameter #2 is $2"
}
kanal=$2
#if [ $# -eq 0 ]
#then
#sudo airmon-ng
#echo "wlanX (0,1,2,3...)?"
#read $nr
#fi
#sudo iwlist wlan$1 scan | grep Frequency | sort | uniq -c | sort -n
#fi

nochmal=y
while [ "$nochmal" = y ]
do
#if [ -z "$kanal" ]
#then

#echo "Kanal (1-13)?"
#read $kanal
#fi
#mon=mon
sudo airmon-ng start wlan"${1}" > /dev/null
besside-ng -c $kanal -vv wlan"${1}"mon 
#set -u
#echo $2

#2=""
#kanal=""
echo "Nochmal (y/n)? "
read nochmal
if [ "$nochmal" = y ]
then echo "Once again..."
fi
done
echo "Monitor beenden (y/n)? "
read down
if [ "$down" = y ]
then sudo airmon-ng stop wlan"${1}"mon > /dev/null
echo Monitor mode stopped.
fi
echo "Dateien verschieben (y/n)? "
read move
if [ "$move" = y ]
then
now=$(date +"%d_%m_%Y---%H_%M")
sudo mkdir /root/wyfi/archiv/$now &&
mv *.cap *.log /root/wyfi/archiv/$now
fi
echo "Servus..."
exit 0
