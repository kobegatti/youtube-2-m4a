#!/bin/bash

# Check if yt-dlp is installed
if ! command -v yt-dlp > /dev/null 2>&1; then
	echo "Error: yt-dlp is not installed or not in PATH."
	exit 1
fi

# Check for YouTube URL 
if [ -z "$1" ]; then
  echo "Usage: $0 \"<YouTube-URL>\""
  exit 1
fi

URL="$1"

# Run yt-dlp to extract .m4a; ignore playlists
yt-dlp --no-playlist \
  -f 'bestaudio[ext=m4a]' \
  --extract-audio \
  --audio-format m4a \
  --audio-quality 0 \
  -o "%(title)s.%(ext)s" \
  "$URL"
