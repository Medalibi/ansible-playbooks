#!/bin/bash

IP_list=(`awk '{print $2}' /media/penelopeprime/Scripts/IP_CSV/EnsemEhiveVM_IP_Address.csv | tail -n 34`)

for j in "${IP_list[@]}"
	do

		./expect $j ":Fr1dge" "sudo rm -rf /usr/lib/python2.7/dist-packages/OpenSSL && sudo rm -rf /usr/lib/python2.7/dist-packages/pyOpenSSL-0.15.1.egg-info && sudo pip install --upgrade pip && sudo pip install pyopenssl"
#		./sshcmd 172.20.15.$j password "apt-get install -y python-pip"
#		./sshcmd 172.20.15.$j password "easy_install -U distribute"


	done
