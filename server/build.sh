mkdir -p keys

if [ ! -f keys/host_key ]; then
  ssh-keygen -q -t rsa -f keys/host_key -N ''
fi

if [ ! -f keys/user_key ]; then
  ssh-keygen -q -t rsa -f keys/user_key -N ''
fi

# build the image
singularity build \
  --fakeroot \
  --force \
  --build-arg user="$USER" \
  sftp.sif \
  sftp.def