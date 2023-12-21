#singularity build --fakeroot sftp.sif sftp.def

output=$(singularity exec sftp.sif cat /home/sftpuser/.ssh/sftpuser_key)

if [[ $output =~ (-----BEGIN[[:space:]]OPENSSH[[:space:]]PRIVATE[[:space:]]KEY-----)(.*)(-----END[[:space:]]OPENSSH[[:space:]]PRIVATE[[:space:]]KEY-----) ]]; then
    # Extract the private key
    echo "${BASH_REMATCH[1]}${BASH_REMATCH[2]}${BASH_REMATCH[3]}" > ~/.ssh/sftp_test_server_key
    chmod 600 ~/.ssh/sftp_test_server_key
    echo "Wrote private key file to ~/.ssh/sftp_test_server_key"
else
    echo "No private key found"
    exit 1
fi

# create new SSH configuration using the private key
echo "Host sftp_test # delete me, I'm just for testing
    HostName localhost
    Port 2222
    User sftpuser
    IdentityFile ~/.ssh/sftp_test_server_key" >> ~/.ssh/config