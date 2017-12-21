#!/bin/bash

echo "1. Training Room 1"
echo "2. Training Room 2"
echo "0. Both Training Rooms"
echo -n "Please choose a word [1,2 or 0]? "
read oper

#################################################
# Training Room 1 Loop:
#################################################
if [ $oper -eq "1" ] || [ $oper -eq "0" ]
then
echo -e "\nStart creating host files for thin clients in TR1\n"
for tc1 in {1..31}
do
	echo -e "Working on Thin Client r1u$tc1...\n"
	host="r1u$tc1"
	cp /usr/local/nagios/etc/simple.cfg /usr/local/nagios/etc/servers/$host.cfg
	sed -r -i "s/r1u29/$host/g" /usr/local/nagios/etc/servers/$host.cfg
	sed -r -i "s/tr1-thinclient/tr1-thinclient/g" /usr/local/nagios/etc/servers/$host.cfg
	sed -r -i "s/TR1 Thin Clients/TR1 Thin Clients/g" /usr/local/nagios/etc/servers/$host.cfg
	sed -r -i "s/Thin Client R1U29/Thin Client R1U$tc1/g" /usr/local/nagios/etc/servers/$host.cfg
	tcIP=$(grep $host$'\t' /etc/ansible/hosts  | awk '{print $2}')
	tcIP=${tcIP#*=}
	sed -r -i "s/172\.25\.9\.34/$tcIP/g" /usr/local/nagios/etc/servers/$host.cfg
	echo -e "Thin Client r1u$tc1 done.\n"
done
echo -e "\nTraining Room 1 Nagios hosts files created\n"
fi
#################################################
# Training Room 2 Loop:
#################################################
if [ $oper -eq "2" ] || [ $oper -eq "0" ]
then
echo -e "\nStart creating host files for thin clients in TR2\n"
for tc2 in {1..31}
do
	echo -e "Working on Thin Client r2u$tc2...\n"
        host="r2u$tc2"
        cp /usr/local/nagios/etc/simple.cfg /usr/local/nagios/etc/servers/$host.cfg
        sed -r -i "s/r1u29/$host/g" /usr/local/nagios/etc/servers/$host.cfg
        sed -r -i "s/tr1-thinclient/tr2-thinclient/g" /usr/local/nagios/etc/servers/$host.cfg
        sed -r -i "s/TR1 Thin Clients/TR2 Thin Clients/g" /usr/local/nagios/etc/servers/$host.cfg
        sed -r -i "s/Thin Client R1U29/Thin Client R2U$tc2/g" /usr/local/nagios/etc/servers/$host.cfg
        tcIP=$(grep $host$'\t' /etc/ansible/hosts  | awk '{print $2}')
        tcIP=${tcIP#*=}
        sed -r -i "s/172\.25\.9\.34/$tcIP/g" /usr/local/nagios/etc/servers/$host.cfg
        echo -e "Thin Client r2u$tc2 done.\n"
done
echo -e "\nTraining Room 2 Nagios hosts files created\n"
elif [ $oper -ne "1" ]
then
echo -e "\nInvalid input!!\n"
fi
