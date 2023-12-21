ssh-keygen -R [localhost]:8000

echo "yes" | ssh -i key sftpuser@localhost -p 8000 -