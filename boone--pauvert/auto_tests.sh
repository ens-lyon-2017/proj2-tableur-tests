#!/bin/sh

tests_dir="tests/"
sol_dir="solutions/"


make


echo -e "\n **************** Starting Tests *****************"
for test in $(ls $tests_dir)
do
	printf "Testing %-10s : %10s" $test
	res=$(./main.native < $tests_dir/$test)
	printf "%10s" $res
	if [ -e $sol_dir/$test ]
	then
		solution=$(cat $sol_dir/$test)
		if [ "-"$solution = "-"$res ]
		then
			echo -e "\t\t--Right Answer"
		else
			echo -ne "\t\t--Wrong Answer"
			printf " - should be \"%s\"\n" $solution
		fi
	else
		echo -e "\t\tERROR : $sol_dir/$test"
	fi
done;
