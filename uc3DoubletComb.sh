#!/bin/bash -x
echo xxxxxxxxxxWELCOMExxxxTOxxxxFLIPxxxxCOINxxxxSIMULATORxxxxxxxxxxx

#Constants declared.
CHECK=1
DOUBLE=2
#Varriable declared.
heads=0
tails=0

read -p "Enter the range for fliping the coin: " range
#declareing a dictionary to store the count
declare -A singlet
declare -A doublet
#logic for the operation.
function flip() {
	random=$((RANDOM%2))
	echo $random
}
for (( count1=1; count1<=range; count1++))
do
	for (( count2=1; count2<=DOUBLE; count2++ ))
	do
		result="$(flip)"
		if (( $result == $CHECK  ))
		then
			echo "HEAD"
			singlet[$count1]=H
			coin+=H
			((heads++))
		else
			echo "TAIL"
			singlet[$count1]=T
			((tails++))
			coin+=T
		fi
	done
	((doublet[$coin]++))
	coin=""
done
echo "Heads count= $heads"
echo "Tails count= $tails"
echo ${singlet[@]}
echo ${!doublet[@]}
echo ${doublet[@]}
#calculating the percentage of heads and tails
headPercent=$(($heads*100/$range))
	echo "pecentage of heads is: $headPercent"
tailPercent=$(($tails*100/$range))
	echo "pecentage of tails is: $tailPercent"
#Calculating count for each and every possibility.
function Percentage()
{
	ranges=$1
	for keyCount in ${!doublet[@]}
	do
		doublet[$keyCount]=$((doublet[$keyCount]*100/$ranges))
		echo "Percentage of $keyCount is: ${doublet[$keyCount]}" 
	done
}
#For displaying the result of percentage.
result1=$(Percentage $range)
	echo "$result1"
