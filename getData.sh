#!/bin/bash

# Base URL
BASE_URL="http://{YOUR IP SERVER / DOMAIN}:{PORT IF CUSTOM}/{FOLDER WANT TO GET DATA}/"

# Directory to save the downloaded files
DOWNLOAD_DIR="{FOLDER WANT TO GET DATA}"
mkdir -p "$DOWNLOAD_DIR"

# Temporary file to store the list of files
TEMP_FILE=$(mktemp)

# Fetch the directory listing and extract file names
wget -q -O - "$BASE_URL" | grep -oP '(?<=href=")[^"]*' | grep -v '^#' | grep -v '^/' | while read -r filename; do
    # Construct the full URL for each file
    file_url="${BASE_URL}${filename}"

    # Download the file
    echo "Downloading: $file_url"
    wget -P "$DOWNLOAD_DIR" "$file_url"
done

# Clean up temporary file
rm "$TEMP_FILE"

echo "Downloads completed. Files are saved in the '$DOWNLOAD_DIR' directory."

