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
	echo `cat /dev/urandom | tr -cd a-zA-Z0-9 | head -c15` | tee -a outputrandom
	# Get the file size in bytes before the append to check if it is greather or equal to 1MB
	filesize=$((A+16))
	#filesize=`du -b test | awk {'print $1'}`
done

# --3--
# File sorted by default in ascendent order, it start with numbers, followed by
# letters from A to Z in upper case and later in lower case. With option -f can
# ignore the case.
sort outputrandom -o outputrandom

