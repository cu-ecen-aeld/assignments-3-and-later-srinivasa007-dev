#!/bin/sh

# Check arguments
if [ $# -ne 2 ]; then
    echo "Error: Missing arguments"
    exit 1
fi

writefile=$1
writestr=$2

# Create directory path if it does not exist
mkdir -p "$(dirname "$writefile")" || {
    echo "Error: Could not create directory"
    exit 1
}

# Write string to file (overwrite if exists)
echo "$writestr" > "$writefile" || {
    echo "Error: Could not create file"
    exit 1
}
