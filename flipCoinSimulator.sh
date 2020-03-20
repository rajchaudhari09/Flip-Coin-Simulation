#!/bin/bash -x
#This problem displays winning percentage of Head or Tail Combination in a Singlet, Doublet and Triplet
echo "-------------------------------------------------------------"
echo "-------------Welcome To Flip Coin Simulator------------------"
echo "-------------------------------------------------------------"
#Declaire Variable
declare -A coinSideDict
Hd=0
Tl=0

#Function For flip
function flip()
{
	read -p "Enter How Many Times You want To FlipCoin : " flips

		for((index=0;index<flips;index++))
		do
            if [[ $((RANDOM % 2)) -eq 1 ]]
            then
                  coinSideDict["result"$index]="Head"
						((Hd++))
            else
                  
                  coinSideDict["result"$index]="Tail"
						((Tl++))
            fi
		done

echo "Heads Percentage: $(echo "scale=2; $Hd * 100 / $flips" | bc )"
echo "Tails Percentage: $(echo "scale=2; $Tl * 100 / $flips" | bc )"
}

#Calling The flip Function
flip
#Print The HEADS And TAILS 
echo  "All Occurrence: "${coinSideDict[@]}
echo "-------------------------------------------------------------"
echo "-------------------------------------------------------------"
echo "-------------------------------------------------------------"
