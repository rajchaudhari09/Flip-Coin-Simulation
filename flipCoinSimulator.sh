#!/bin/bash -x
#This problem displays winning percentage of Head or Tail Combination in a Singlet, Doublet and Triplet

echo "-------------------------------------------------------------"
echo "-------------Welcome To Flip Coin Simulator------------------"
echo "-------------------------------------------------------------"

#Function For Simulator
function simulator()
{

#Declaring Variable

key=""
flips=$1
coins=$2

#Declairing Dictionary

declare -A coinSideDict

	for((indexOne=1;indexOne<=$flips;indexOne++))
	do

		for((indexTwo=1;indexTwo<=$coins;indexTwo++))
		do

		    if(( $((RANDOM%2==0)) ))
          then

                  key+=H
	       else

                  key+=T
          fi

		done
		coinSideDict[$key]=$((${coinSideDict[$key]}+1))
		key=""

	done

	echo  "All Key: " ${!coinSideDict[@]}
	echo  "All Number Of Key: " ${coinSideDict[@]}

#Calling The Percentage Function

percentage

}

#Fuction For Calculate The Percentage  

function percentage()
{
	for key in ${!coinSideDict[@]}
	do

		coinSideDict[$key]=$((${coinSideDict[$key]} * 100 / $flips))

	done

	echo  "All Key: "${!coinSideDict[@]}
	echo  "All Number Of Key Percentage: "${coinSideDict[@]}

}

#Function For The mainFunction

function mainFunction()
{
	local flips=0
	read -p "Entered Y To Play Otherwise Any Keys For Quite: " play

	while [ "$play" == 'y' ]
	do

		read -p "Enter How Many Times You want To FlipCoin : " flips
		echo -e "Choose The 1 For Singlet Coins: \nChoose The 2 For Doublet Coins: \nChoose The 3 For Triplet Coins: "
		read choice
		case $choice in
				1)
						simulator $flips 1		#Calling The Simulator Function
						;;
				2)
						simulator $flips 2		#Calling The Simulator Function
						;;
				3)
						simulator $flips 3		#Calling The Simulator Function
						;;
				*)
						echo "Invalid Option"
						;;
		esac
		read -p "Entered y To Play Otherwise Any Keys For Quite: " play

	done

}

#Calling The mainFunctions

mainFunction

echo "-------------------------------------------------------------"
echo "-------------------------------------------------------------"
echo "-------------------------------------------------------------"
