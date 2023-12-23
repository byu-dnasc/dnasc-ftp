known_host_record="[localhost]:8000 ssh-rsa $(cat keys/host_rsa_key.pub)"

if ! grep -q "$known_host_record" ~/.ssh/known_hosts; then
    echo "$known_host_record" >> ~/.ssh/known_hosts
fi

# singularity run --fakeroot sftp.sif sftp_server.def

ssh -i keys/user_rsa_key -p 8000 sftpuser@localhost

