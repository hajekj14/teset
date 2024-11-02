#!/bin/sh
./wstunnel server ws://[::]:8888 &
pid1=$!

nginx -g 'daemon off;' &
pid2=$!

# Wait for both commands to finish and capture their exit codes
wait $pid1
status1=$?

wait $pid2
status2=$?

# Check if any command failed (exit code not zero)
if [ $status1 -ne 0 ] || [ $status2 -ne 0 ]; then
    echo "One or both commands failed."
    exit 1
else
    echo "Both commands succeeded."
    exit 0
fi