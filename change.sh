#!/bin/bash

# Specify the file name
file_name="file.txt"

# Check if the file exists
if [ -e "$file_name" ]; then
    # Count the lines of the file
    line_count=$(wc -l < "$file_name")
    echo "1. The file $file_name has $line_count lines."

    # Count the total number of 'Z' characters
    z_count=$(grep -io 'Z' "$file_name" | wc -l)
    echo "2. Total number of 'Z' characters: $z_count/Z"

    # Display the lines containing the words "junior," "platform," and "engineer" along with their line numbers
    echo "3. Lines containing 'junior,' 'platform,' and 'engineer':"
    awk 'tolower($0) ~ /(junior|platform|engineer)/ {print NR, $0}' "$file_name"

    # Replace the word Junior with Senior and display the output
    sed -i 's/Junior/Senior/g' file.txt
    echo " Replacing junior with senior"
    awk 'tolower($0) ~ /(senior|platform|engineer)/ {print NR, $0}' "$file_name"

 fi
