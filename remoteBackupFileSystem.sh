#!/bin/bash

#config variables
remote_server='google.bcpratt.com'
remote_dir='/mnt/drive/Benver'
remote_port='22'
remote_user='bcpratt2000'
local_directory='/mnt/FTP_drive'

echo 'starting server transfer'

rsync -zav $local_directory $remote_user@$remote_server:$remote_dir

echo 'All operations completed'
