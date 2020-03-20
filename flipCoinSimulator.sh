#!/bin/bash -x
#This problem displays winning percentage of Head or Tail Combination in a Singlet, Doublet and Triplet
echo "-------------------------------------------------------------"
echo "-------------Welcome To Flip Coin Simulator------------------"
echo "-------------------------------------------------------------"
#Declaire Variable
H=0
T=0

#User From The Input
read -p "enter  how many times to flip coin: "

#Function For flip
function flip()
{
         flipResult=$((RANDOM%2))
            if [[ $flipResult -eq 0 ]]
            then
                  echo "Head"
            else
                  echo "Tail"
            fi
}

#Calling The flip Function
flip
echo "-------------------------------------------------------------"
echo "-------------------------------------------------------------"
echo "-------------------------------------------------------------"
