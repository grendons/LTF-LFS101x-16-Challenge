#!/bin/bash

#1
rm test

A=0
until [ $A -gt 10 ]; do
	echo `cat /dev/urandom | tr -cd a-zA-Z0-9 | head -c15` >> test
	A=$(( A+1 ))
done
