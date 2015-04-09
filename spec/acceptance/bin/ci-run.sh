#!/bin/bash

# This script exists primarily so that we can run on CI infrastructures, such
# as Travis-CI, which consider a job dead if it does not produce any output on
# stdout in a given time period.

start_time=$(date +%s)
sleep_interval=120
tick_interval=5
tick_elapsed=0

# Execute given arguments as a background command
"$@" &
jobpid=$!

# So long as the background job is still running, periodically print a
# heartbeat to stdout
while jobs -l | grep "$jobpid Running" >/dev/null 2>&1; do
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
done

