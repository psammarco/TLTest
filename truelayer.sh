#!/bin/sh 
#
## Script has been tested on Gentoo and GNU bash version 5.0.18(1)-release. 

workdir="$HOME/TrueLayer"
filename="TLTest.txt" 
rootdir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

if [ ! -d $workdir ]; then
	mkdir -p $workdir       
	fi

echo -e " \b" >> $workdir/$filename;
echo "Script has been executed" >> $workdir/$filename;

echo "exec-time: $(date "+%m.%d.%Y %H.%M")" >> $workdir/$filename;
echo "filename: $(basename "$filename" | sed 's/\(.*\)\..*/\1/')" >> $workdir/$filename;

ls -ltra $rootdir >> $workdir/$filename;

whatsmyip=$(host myip.opendns.com resolver1.opendns.com |tail -3 |head -1 |awk '{print $4}')

echo -ne "Public IP: $whatsmyip" >> $workdir/$filename;
echo " " >> $workdir/$filename;

totalmem=$(vmstat -s -S m |grep 'total memory' |awk '{print $1}')

echo -ne "Available Memory: $totalmem" >> $workdir/$filename
echo " "  >> $workdir/$filename

echo -ne "PID: $BASHPID"  >> $workdir/$filename;
echo " "  >> $workdir/$filename;

exit 0
