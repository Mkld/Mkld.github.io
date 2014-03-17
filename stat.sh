#!/bin/bash                                                                     
    ls=`cat historique | grep ls | wc -l`
    cd=`cat historique | grep cd | wc -l`
    pwd=`cat historique | grep pwd | wc -l`
    mv=`cat historique | grep mv | wc -l`
    cp=`cat historique | grep cp | wc -l`
    touch=`cat historique | grep touch | wc -l`
    mkdir=`cat historique | grep mkdir | wc -l`
    cat=`cat historique | grep cat | wc -l`
if [ -e stats ]
then
    prels=`cat stats | grep ls | cut -d "=" -f2`
    precd=`cat stats | grep cd | cut -d "=" -f2`
    prepwd=`cat stats | grep pwd | cut -d "=" -f2`
    premv=`cat stats | grep mv | cut -d "=" -f2`
    precp=`cat stats | grep cp | cut -d "=" -f2`
    pretouch=`cat stats | grep touch | cut -d "=" -f2`
    premkdir=`cat stats | grep mkdir | cut -d "=" -f2`
    precat=`cat stats | grep cat | cut -d "=" -f2`
    ls=$(echo "$ls + $prels;" | bc)
    cd=$(echo "$cd + $precd;" | bc)
    pwd=$(echo "$pwd + $prepwd;" | bc)
    mv=$(echo "$mv + $premv;" | bc)
    cp=$(echo "$cp + $precp;" | bc)
    touch=$(echo "$touch + $pretouch;" | bc)
    mkdir=$(echo "$mkdir + $mkdir;" | bc)
    cat=$(echo "$cat + $precat;" | bc)
fi
rm stats
echo 'ls = '"$ls" >> stats
echo 'cd = '"$cd" >> stats
echo 'pwd = '"$pwd" >> stats
echo 'mv = '"$mv" >> stats
echo 'cp = '"$cp" >> stats
echo 'touch = '"$touch" >> stats
echo 'mkdir = '"$mkdir" >> stats
echo 'cat = '"$cat" >> stats
echo "" > historique