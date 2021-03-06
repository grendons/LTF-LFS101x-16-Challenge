#!/bin/bash

# Start the output file in empty
> outputrandom

# Get the file size in bytes of the output file "outputrandom" with du, with awk
# gets the first column of the du output
filesize=`du -b outputrandom | awk {'print $1'}`
# Can get the file size with ls command
# filesize=`ls -l outputrandom | awk {'print $5'}`

# --2--
# Check the filesize to reach up to 1024KB = 1MB = 1048576B
until [ $filesize -ge 1048576 ]; do
	# --1--
	# urandom generates a random characters, with tr and options -cd complements
	# the filter of only characters from a-z, A-Z and 0-9 characters, with head
	# up to 15 bytes, every character is a byte and tee apprends write the 15
	# random chars to outputrandom file.
	echo `cat /dev/urandom | tr -cd a-zA-Z0-9 | head -c15` >> outputrandom
	# Get the file size in bytes before the append to check if it is greather or equal to 1MB
	filesize=`du -b outputrandom | awk {'print $1'}`
done

# --3--
# File sorted by default in ascendent order, it start with numbers, followed by
# letters from A to Z in upper case and later in lower case. With option -f can
# ignore the case.
sort outputrandom -o outputrandom

# --4--
# With sed we can filter each line that starts with 'a' or 'A' and delete it
# and saves the output in a new file.
# ^a	start the line with character 'a'
# I	ignore the case of a, also can be 'A'
# d	deletes the line of occurence
sed -n '/^a/Id;w outputrandomfiltered' outputrandom

# --5--
# wc -l gets the number of lines for original file and filtered file and print
# out the result.
file1lines=`wc -l < outputrandom`
file2lines=`wc -l < outputrandomfiltered`
filteredlines=$((file1lines-file2lines))
echo '<'$filteredlines'> lines were removed.'
