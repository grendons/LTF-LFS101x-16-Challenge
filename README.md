# LTF-LFS101x-16-Challenge
The solution can be found in [https://github.com/grendons/LTF-LFS101x-16-Challenge](https://github.com/grendons/LTF-LFS101x-16-Challenge)

The challenge.sh script generates a file with 15 random characters from a to z, A to Z and 0 to 9 in each line, up to 1MB of file size. Later It is ordered and filtered lines starting with a o A are deleted and saves the output in a filtered file and count the number of lines deleted.

The solution uses an until loop for check the file size up to 1MB, du is used to obtaining the size of the file and with awk takes only the first column value.

Each line is compound of random characters from /dev/urandom, because it is fast, and head takes only the first 15 bytes that represent the first 15 characters, each character is 1 byte, to ensure to take only a to z, A to Z and 0 to 9, tr command is used and the result is append to the file.

Later, the sort command will order the lines in ascendant order, in the exercise hasn't any specific order restriction.

The see command can filter the lines with a regular expression that sets the output in a new filtered file.

Finally the wc command can count the lines from original file and filtered file, the difference is the number of deleted lines.

The outputrandom file has the complete ordered random strings.
The outputrandomfiltered file has filtered random strings.
