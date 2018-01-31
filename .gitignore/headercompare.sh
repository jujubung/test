#!/bin/bash

echo Input your first URL, ex\) http or https://www.example.com/
read input1
echo Input your second URL, ex\) http or https://www.example.com/
read input2
url1=$input1
url2=$input2

#Taking input from the user for target URLs for the comparison. 

echo -e "\n"
echo "########## petching the headers ############"
echo -e "\n"

curl -I "{$url1}" > ./url1.result
curl -I "{$url2}" > ./url2.result

#Petching Each URL only for response header with "-I" option.

sort url1.result
sort url2.result

#Sorting the result for comparison

echo -e "\n"
echo "############################################"
echo "########## Diff Result Showing #############"

diff -ui <(sort ./url1.result) <(sort ./url2.result) | sort -rb

#Running Diff

rm ./url1.result
rm ./url2.result

cat << EOF
Note) Result Explain
"+" Indicates a line in the second URL added.
"-" Indicates a line in the second URL removed from the first URL.
Other lines without "+,-" are not changed.

# Showing the result, added Lines, Removed Lines, Dupulicated Lines from Diff Too.
