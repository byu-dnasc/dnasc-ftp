if [ ! -f host_rsa_key ]; then
  ssh-keygen -q -t rsa -f host_rsa_key -N ''
fi

user_key=$HOME/.ssh/sftp_test_key
if [ ! -f $user_key ]; then
  ssh-keygen -q -t rsa -f $user_key -N ''
  chmod 600 $user_key
fi

# build the SIF
singularity build \
  --fakeroot \
  --force \
  --build-arg user="$USER" \
  --build-arg uid=$(id -u) \
  --build-arg home="$HOME" \
  sftp.sif \
  sftp.def