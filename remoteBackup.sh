#!/bin/bash

#script that compresses a folder into a tar.gz and moves it to a remote server
#keeps 7 daily backups at a time


#dependencies
	#lftp
	#tar

#config variables



remote_server='google.bcpratt.com'
remote_dir='/mnt/drive'
remote_port='22'
remote_user='bcpratt2000'
local_directory='/mnt/FTP_drive'

tmp_directory='/mnt/FTP_drive/tmp/'


#program variables

day=$(date +%F)

#start program

cd $tmp_directory

rm *.tar # clear tmp folder

echo 'Compressing file'
tar -vcf $day.tar $local_directory

echo 'Changing permissions'
chmod 777 $day.tar

echo 'Removing old remote file'

#lftp -p $remote_port -u $remote_user $remote_server << --EOF--
#	cd $remote_dir
#	rm $day.tar.gz
#	quit
#--EOF--

echo 'starting server transfer'

rsync -zav $day.tar $remote_user@$remote_server:$remote_dir

echo 'Removing temporary file'
rm *.tar

echo 'All operations completed'
