#!/bin/sh

# Check arguments
if [ $# -ne 2 ]; then
    echo "Error: Missing arguments"
    exit 1
fi

filesdir=$1
searchstr=$2

# Check directory
if [ ! -d "$filesdir" ]; then
    echo "Error: $filesdir is not a directory"
    exit 1
fi

# Count files recursively (suppress permission errors)
num_files=$(find "$filesdir" -type f 2>/dev/null | wc -l)

# Count matching lines recursively (suppress permission errors)
num_matching_lines=$(grep -r "$searchstr" "$filesdir" 2>/dev/null | wc -l)

# Required output
echo "The number of files are $num_files and the number of matching lines are $num_matching_lines"

