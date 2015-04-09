#!/bin/bash

# This script exists primarily so that we can run on CI infrastructures, such
# as Travis-CI, which consider a job dead if it does not produce any output on
# stdout in a given time period.

start_time=$(date +%s)
sleep_interval=120
tick_interval=5
tick_elapsed=0

# Start printing a heartbeat to stdout as a background command
while true; do
  sleep $tick_interval
  tick_elapsed=$(($tick_elapsed+$tick_interval))
  if [ "$tick_elapsed" -ge "$sleep_interval" ]; then
    total_elapsed=$(($(date +%s)-$start_time))

    if [ "$(uname)" = "Darwin" ]; then
      echo "(HEARTBEAT: $(date -u -r ${total_elapsed} +%T) elapsed since job start)"
    else
      echo "(HEARTBEAT: $(date -u -d @${total_elapsed} +%T) elapsed since job start)"
    fi
    tick_elapsed=0
  fi
done &
heartbeat_pid=$!

# Set a trap to kill the background heartbeat when the script exits (in case
# something goes wrong)
trap "kill $heartbeat_pid" 0

# Execute given arguments as a command
"$@"
job_exit_code=$?

# kill the heartbeat and return the job exit code
kill $heartbeat_pid
exit $job_exit_code
