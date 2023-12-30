PORT=${SFTP_PORT:-$DEFAULT_SFTP_PORT}

# attempt to connect to the server
sftp \
  -i keys/user_key \
  -o StrictHostKeyChecking=no \
  -o UserKnownHostsFile=/dev/null \
  -o LogLevel=ERROR \
  -P $PORT $USER@localhost

# if sftp exited with an error code, do some diagnostics
if [ $? -ne 0 ]; then
  if singularity instance list | grep -q $CONTAINER; then
    # (the container is running)
    if ! singularity exec instance://$CONTAINER ps aux | grep -q sshd; then
      echo "The sftp server is not running."
    fi
  else
    echo "The container is not running."
  fi
fi