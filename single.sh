#!/bin/bash

scrape_spotify() {
  # Check if an argument was provided
  if [ $# -eq 0 ]; then
    echo "No argument provided."
  else
    # Call the Node.js script and capture its output
    node_output=$(node spotify.js "$1")
    # Handle spaces
    search_query=$(echo "$node_output" | sed 's/ /_/g')
    result="ytsearch1:${search_query}"
    # Pass result to yt-dlp
    yt-dlp -x --audio-format mp3 $result
  fi
}

# Get the input URL from command-line arguments
input_url="$1"

# Check if the URL starts with "spotify.link" or "open.spotify.com"
if [[ $input_url == "https://spotify.link"* ]]; then
  final_url=$(curl -s -w %{url_effective} -o /dev/null -L "$input_url")
  scrape_spotify "$final_url"
elif [[ $input_url == "https://open.spotify.com"* ]]; then
  scrape_spotify "$input_url"
else # Assuming Youtube URL
  yt-dlp -x --audio-format mp3 $input_url
fi
