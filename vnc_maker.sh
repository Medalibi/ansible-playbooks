#/bin/bash

for tc in {1..31}
do
	echo -e "Working on Thin Client r2u$tc ...\n"
	host="r2u$tc"
	cp /media/penelopeprime/Scripts/VNC/simple.vnc /media/penelopeprime/Scripts/VNC/$host.vnc
	sed -r -i "s/r1u1/$host/g" /media/penelopeprime/Scripts/VNC/$host.vnc
	tcIP=$(grep $host$'\t' /etc/ansible/hosts  | awk '{print $2}')
	tcIP=${tcIP#*=}
	sed -r -i "s/IP/$tcIP/g" /media/penelopeprime/Scripts/VNC/$host.vnc
done
