#!/bin/bash

# Problem Statement:
# a. First list the files containing the word “sample” and at least 3 occurrences of the word “CSC510”. Note that we are no longer talking about lines containing the word “CSC510” but instead the actual number of times the word “CSC510” occurs. You are not allowed to use gawk for this task but instead use a combination of grep and uniq (note: if you are unfamiliar with uniq, on a terminal write man uniq and you will get the user manual for the command uniq).
# b. Sort in descending order the list of the filtered files based on the occurrences of the word “CSC510”. You have to break the ties by the size of the files. You will have to use gawk along with the other commands for this task.
# c. Finally, from each file name substitute “file_” with “filtered_” and list the final output.
# Build a single pipeline of commands for all the tasks a, b, and c and store the pipeline inside a script called task2.sh.

# Solution:
cd dataset1 # We move to drectory dataset1 to keep the input and output simple and neat
grep -rl "sample" | xargs grep -o "CSC510" | cut -d: -f1| xargs ls -l | uniq -c | grep -E "[3-9] -|[0-9]{2,} -" | awk '{print $1 ,$6, $10}'| sort -k1,1nr -k2,2nr| sed 's/file/filtered/'| awk -F/ '{print $2}'