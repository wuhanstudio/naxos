#! /bin/sh
set -ev
# Calculate the available time for searching a solution
cd datasets
AVAILABLE_SECONDS=$(yes | ./benchmark_my_linux_machine | \
                    grep "seconds" | grep -o "[[:digit:]]*")
cd -
# Set the available time
sed -i "s/^\(timeLimit\) .*/\1 $AVAILABLE_SECONDS/" optionsFile && \
sed -i "s/^\(timeLimitDirectMethodRound\) .*/\1 $AVAILABLE_SECONDS/" optionsFile
# Execute the curriculum based course timetabling solver
./itc_solver datasets/comp01.ctt comp01.sol -options optionsFile
# Compile the official validator
g++ verification/validator.cc -o verification/validator
# Validate the last solution found
verification/validator datasets/comp01.ctt comp01.sol > validation.txt
# Calculate the constraint categories were no hard constraints were violated
CATEGORIES=$(grep -c "^Violations of [[:alpha:]]* (hard) : 0$" validation.txt)
# The constraint categories are four
test $CATEGORIES -eq 4