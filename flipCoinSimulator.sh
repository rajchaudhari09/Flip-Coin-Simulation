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

	#Outer Loop For Number Of Flips
	for((indexOne=1;indexOne<=$flips;indexOne++))
	do

		#Inner Loop For Number Of Coins
		for((indexTwo=1;indexTwo<=$coins;indexTwo++))
		do

		    if(( $((RANDOM%2==0)) ))
          then

						#Append Value In Key
                  key+=H
	       else

                  key+=T
          fi

		done

		#Storing Value In Key And Increment Occurrence
		coinSideDict[$key]=$((${coinSideDict[$key]}+1))
		#Making Key Blank For Next Iteration
		key=""

	done
	echo  "All Key: " ${!coinSideDict[@]}
	echo  "All Number Of Key: " ${coinSideDict[@]}

	#Calculate The Percentage
	for key in ${!coinSideDict[@]}
	do

		coinSideDict[$key]=$(echo "scale=2;${coinSideDict[$key]} * 100 / $flips" | bc )

	done

	echo  "All Number Of Key Percentage: "${coinSideDict[@]}

}

#Function For The mainFunction

function mainFunction()
{
	local flips=0
	read -p "Do You Want To play [ Y | N ]: " play

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
		read -p "Do You Want To Continue [ Y | N ]: " play

	done

}

#Calling The mainFunctions

mainFunction

echo "-------------------------------------------------------------"
echo "-------------------------------------------------------------"
echo "-------------------------------------------------------------"
