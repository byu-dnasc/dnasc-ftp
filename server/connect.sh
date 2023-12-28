if [ -z "$SFTP_PORT" ]; then
  echo "SFTP_PORT is not exported."
  exit 1
fi

# add host key to known hosts (if not already added)
host_record="[localhost]:$SFTP_PORT $(awk '{print $1" "$2}' keys/host_key.pub)"
if ! grep -Fxq "$host_record" $HOME/.ssh/known_hosts; then
  echo "$host_record" >> $HOME/.ssh/known_hosts
fi

sftp \
  -i keys/user_key \
  -P $SFTP_PORT $USER@localhost

# remove host key from known hosts (leave no trace)
ssh-keygen -q -R "[localhost]:$SFTP_PORT" > /dev/null