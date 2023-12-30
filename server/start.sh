singularity instance start \
  sftp.sif \
  $CONTAINER

container_output_file="$HOME/.singularity/instances/logs/$HOSTNAME/$USER/${CONTAINER}.out"
if [ -s "$container_output_file" ]; then
  echo "$0: From container log:"
  awk '{print "# "$0}' "$container_output_file"
  last_line=$(tail -n 1 $container_output_file)
  if echo "$last_line" | grep -q "exit" ; then
    echo "$0 will now stop the container."
    singularity instance stop $CONTAINER
  fi
  > "$container_output_file"
fi