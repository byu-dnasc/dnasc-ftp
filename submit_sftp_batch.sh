#!/bin/bash

# Check that two arguments are provided
[ $# -ne 2 ] && echo "Usage: $0 <batch_file.txt> <sftp_host_name>" && exit 1

read -p "Please provide the path to a directory in which \
the directory of files should be deposited." DEST_PATH

grep $HOME/.ssh/config # get hostnames

echo "Please choose a host:"

cat $1 | sftp -q -b - $HOST:$DEST_PATH

[ $? -ne 0 ] && echo "Transfer failed." && exit 1
