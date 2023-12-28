if [ -z "$SFTP_PORT" ]; then
  echo "SFTP_PORT is not exported."
  exit 1
fi

# add host key to known hosts (if not already added)
host_record="[localhost]:$SFTP_PORT $(awk '{print $1" "$2}' host_rsa_key.pub)"
if ! grep -Fxq "$host_record" $HOME/.ssh/known_hosts; then
  echo "$host_record" >> $HOME/.ssh/known_hosts
fi

sftp \
  -i $HOME/.ssh/sftp_test_key \
  -P $SFTP_PORT $USER@localhost