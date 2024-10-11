#!/bin/bash

# Given task:
# a. Extract passengers from 2nd class who embarked at Southampton.
# b. Then replace male/female labels with respectively M/F.
# c. Finally, calculate the average age of the filtered passengers.
# Build a single pipeline of commands for all the tasks a, b, and c and store the pipeline inside a script called task3.sh.

# Solution explaination:
# Since out dataset file contains data from row=2, we skip first line and do NR>1 and check the last value using $NF to be equal to 'S'
# Then we replace male/female labels with M/F respectively.
# Finally, we use total_people to keep track of all people in filtered dataset and add their age. Then we calculate their average for the desired output.

awk -F, 'NR > 1 && $3 == 2 && $NF ~ /S/ {print $0}' titanic.csv | sed -e 's/,male,/,M,/' -e 's/,female,/,F,/'| awk -F, 'BEGIN {total_people = 0; total_age_sum = 0} {if ($7 != "") {total_people+=1; total_age_sum+=$7; print $0}} END {print "Avg age of the filtered list: " total_age_sum/total_people}'