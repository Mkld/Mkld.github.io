#!/bin/bash

echo "Enter your name :"
read user_name

if [ ! -f "$user_name"".log" ]
then
    echo "Before starting this program please execute this command : history >> $user_name.log"
    exit
else
    echo "Welcome $user_name"
fi

echo "Enter the folder that content your index.html :"
read folder_name

while [ ! -f "$folder_name/index.html" ]
do
    echo "There is no index.html here !"
    echo "Enter a folder that content your index.html :"
    read folder_name
done

echo "Ok, your index.html is linked to your log file"

com_tableau=( "ls" "cd" "pwd" "cp" "mv" "touch" "mkdir" "emacs" "nano" "cat")

for index in "${!com_tableau[@]}"
do
    declare c_"${com_tableau[$index]}"=`grep -wc "${com_tableau[$index]}" "$user_name"".log"| cut -d " " -f1`
    var="c_"${com_tableau[$index]}
    sed -i "" s/arr_stat.${com_tableau[$index]}=[0-9]*/arr_stat.${com_tableau[$index]}=${!var}/g "$folder_name"/stats.js
done

for index in "${!com_tableau[@]}"
do
    var="c_"${com_tableau[$index]}
    declare varsucc=`grep -w "var tab_com_succ" "$folder_name"/content.js`
    declare vardef=`grep -w "var tab_com_def" "$folder_name"/content.js`
    declare varsucc2=`grep -w "var tab_com_succ" "$folder_name"/content2.js`
    declare vardef2=`grep -w "var tab_com_def" "$folder_name"/content2.js`

    if [ ! -z ${!var} ]
    then
        if [ ${!var} -eq "0" ]
        then
            if grep -q \"${com_tableau[$index]}\" <<< $varsucc
            then
              sed -i "" s/\"${com_tableau[$index]}\",\ \/""/g "$folder_name"/content.js
              sed -i "" s/var\ \tab_com_def\ \=\ \new\ \Array\(/var\ \tab_com_def\ \=\ \new\ \Array\(\"${com_tableau[$index]}\",\ \/g "$folder_name"/content.js 
            fi
        fi
        if [ ${!var} -le "9" ]
        then
            if grep -q \"${com_tableau[$index]}\" <<< $varsucc2
            then
              sed -i "" s/\"${com_tableau[$index]}\",\ \/""/g "$folder_name"/content2.js
              sed -i "" s/var\ \tab_com_def\ \=\ \new\ \Array\(/var\ \tab_com_def\ \=\ \new\ \Array\(\"${com_tableau[$index]}\",\ \/g "$folder_name"/content2.js 
            fi
        fi
        fi
    	if [ ${!var} -ge "1" ]
    	then
    	    if grep -q \"${com_tableau[$index]}\" <<< $vardef
    	    then
    	      sed -i "" s/\"${com_tableau[$index]}\",\ \/""/g "$folder_name"/content.js
                  sed -i "" s/var\ \tab_com_succ\ \=\ \new\ \Array\(/var\ \tab_com_succ\ \=\ \new\ \Array\(\"${com_tableau[$index]}\",\ \/g "$folder_name"/content.js 
                  echo "Good job, you've just unlocked a new achievement : Make your first ${com_tableau[$index]}"
            fi
        fi
        if [ ${!var} -ge "10" ]
        then
            if grep -q \"${com_tableau[$index]}\" <<< $vardef2
            then
              sed -i "" s/\"${com_tableau[$index]}\",\ \/""/g "$folder_name"/content2.js
                  sed -i "" s/var\ \tab_com_succ\ \=\ \new\ \Array\(/var\ \tab_com_succ\ \=\ \new\ \Array\(\"${com_tableau[$index]}\",\ \/g "$folder_name"/content2.js 
                  echo "Good job, you've just unlocked a new achievement : Make ten ${com_tableau[$index]}"
            fi
    fi
done

rm "$user_name"".log"
