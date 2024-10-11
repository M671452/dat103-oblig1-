#!/bin/bash

# Create a directory called "task1-bash"):
# The "-p" makes it only be created if it doesn't already exist.
mkdir -p "task1-bash"

# Copy the text "jurassicParkCast" to "task1-bash",
# and change the filename to "cast":
cp "jurassicParkCast.txt" "task1-bash"
cd  "task1-bash"
mv "jurassicParkCast.txt" "cast.txt"

# Listing out the contens of "task1-bash",
# without being in the directory:
cd ..
ls "task1-bash"

# Draw a horizontal line on terminal (simple way):
echo "--------------------------------------------------"

# Show and sort "cast" file in ascending order:
cd "task1-bash"
awk 'NR>1' "cast.txt" | sort -t',' -k5,5n

# Repeating echo above:
echo "--------------------------------------------------"

# Only show lines that contain a name starting with the letter L in "cast":
awk -F',' 'NR>1 && ($1 ~ /^L/ || $2 ~ /^L/ || $3 ~ /^L/) {print $0}' "cast.txt"

# Repeating echo above:
echo "--------------------------------------------------"

# Copy all women in "cast" to a new file named "women":
awk -F',' 'NR>1 && $4 ~ /F/ {print $0}' "cast.txt" | tee "women.txt"

# Repeating echo above:
echo "--------------------------------------------------"

# Copy all men in "cast" to a new file named "men":
awk -F',' 'NR>1 && $4 ~ /M/ {print $0}' "cast.txt" | tee "men.txt"

# Repeating echo above:
echo "--------------------------------------------------"

# For-loop to create two copies for each of the txt-files:
for i in *.txt; do
    fileName=$(basename "$i" .txt)
    cp "$i" "${fileName}-1.txt"
    cp "$i" "${fileName}-2.txt"
done

# Print newline, word, and byte count for each file:
wc *.txt
