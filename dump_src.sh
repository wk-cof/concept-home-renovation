#!/bin/bash

# This script collects all the source code files from the `src` directory
# and other useful directories (like CSS and HTML includes), and outputs them
# to a temporary file for easy reference.

# Define the directories to include
dirs=("src" "src/_includes" "src/assets")

# Define the temporary file to store output
temp_file="/tmp/website_source_output.txt"

# Clear the contents of the temp file if it already exists
> "$temp_file"

# Iterate through the directories and append their contents to the temp file
for dir in "${dirs[@]}"; do
  if [ -d "$dir" ]; then
    echo "\n### Contents of directory: $dir ###" >> "$temp_file"
    for file in "$dir"/*; do
      if [ -f "$file" ]; then
        echo "\n--- $file ---" >> "$temp_file"
        cat "$file" >> "$temp_file"
      fi
    done
  fi
done

# Print the location of the temp file
echo "Source code collected in: $temp_file"
