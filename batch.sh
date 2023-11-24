#!/bin/bash

# Check if batch.txt exists
if [ -f "batch.txt" ]; then
  # Read batch.txt line by line and pass each line as an argument to go.sh
  while IFS= read -r line; do
    ./go.sh "$line"
  done < "batch.txt"
else
  echo "batch.txt does not exist."
fi
