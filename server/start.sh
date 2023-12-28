if [ -z "$SFTP_PORT" ]; then
  echo "SFTP_PORT is not exported."
  exit 1
fi

singularity run sftp.sif \
  -p $SFTP_PORT "$@" \
  > container.log 2>&1 &

echo "container running with PID $!" > container.log