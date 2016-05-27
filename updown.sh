#!/bin/bash

#updown.sh [IP] [TEAM DIR] [X DIR] [FTP USERNAME] [FTP PASSWORD] [FTP PORT] [LOCAL DIR]
#ex : sudo sh updown.sh 192.168.0.106 Dronolab%20ETS Secret%20Folder%20Name pi club /Users/XX/Sites/test/

HOST=$1
TEAMDIR=$2
XDIR=$3
USERNAME=$4
PASSWORD=$5

LDIR=$6
FILEUP='upload.txt'
FILEDOWN='download.txt'


wget_output=$(wget -c --user=$USERNAME --password=$PASSWORD ftp://$HOST/$TEAMDIR/$XDIR/$FILEDOWN -o $LDIR/logDown -P $LDIR)
if [ $? -ne 0 ]; then
	echo "DOWNLOAD FAIL"
else 
	echo "DOWNLOAD SUCCESS"
fi

sleep 1

cd $LDIR
wput_output=$(wput -u $FILEUP ftp://$USERNAME:$PASSWORD@$HOST/$TEAMDIR/$XDIR/ >> logUp)
if [ $? -ne 0 ]; then
	echo "UPLOAD FAIL"
else 
	echo "UPLOAD SUCCESS"
fi
