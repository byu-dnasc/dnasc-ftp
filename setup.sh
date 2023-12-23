mkdir keys

ssh-keygen -q -t rsa -f keys/host_rsa_key -N ''
ssh-keygen -q -t rsa -f keys/user_rsa_key -N ''