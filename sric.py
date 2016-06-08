#!/usr/bin/env python

import os
import time, sys, commands

status, wlan1ip = commands.getstatusoutput("ifconfig wlan1 | grep 'inet addr:' | cut -d: -f2 | awk '{ print $1}'")

while wlan1ip == "":
	os.system("ifdown wlan1")
	time.sleep(1)
	os.system("ifup wlan1")
	status, wlan1ip = commands.getstatusoutput("ifconfig wlan1 | grep 'inet addr:' | cut -d: -f2 | awk '{ print $1}'")


if wlan1ip == "":
	print "************ SRIC NOT CONNECTED ************"
else:
	print "************ SRIC CONNECTED ************"
	#updown.sh [IP] [TEAM DIR] [X DIR] [FTP USERNAME] [FTP PASSWORD] [FTP PORT] [LOCAL DIR] [FILE NAME UP] [FILE NAME DOWN]
	sric_status = commands.getstatusoutput("sudo sh /home/pi/auvsi-sric/updown.sh 192.168.1.129 auvsi/Dronolab%20ETS Secret%20Folder%20Name pi superclub 21 /home/pi/photos/sric upload.txt download.txt")
	print sric_status
