#!/bin/bash
target_pid=$1
echo "Waiting for Minecraft to close before finalizing setup"
while kill -0 $target_pid > /dev/null 2>&1; do
    sleep 1
done
# Deleting the "mods" folder
rm -rf "mods"
# Renaming the "modjars" folder to "mods"
mv "modjars" "mods"
# Deleting the script itself
rm "$0"
