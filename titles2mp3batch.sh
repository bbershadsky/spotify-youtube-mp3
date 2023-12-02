#!/bin/bash

# Input file
input_file="batch_titles.txt"

# Loop through each line in the input file
while IFS= read -r line; do
    # Replace spaces with underscores and store in the 'result' variable
    result="ytsearch1:${line// /_}"

    # Pass 'result' to yt-dlp
    yt-dlp -x --audio-format mp3 "$result"
done <"$input_file"
