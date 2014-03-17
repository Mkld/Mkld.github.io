#!/bin/bash
if [ -f datemj ]
then
    lastdate=`cat datemj | tr -d '\r\n'`
else
    lastdate="0"
fi


while read line
do
    temp=$line
    var=`echo $temp | cut -d ":" -f 2`
    if [ "$var" -ge "$lastdate" ]
    then
        echo $line | cut -d ":" -f3 | cut -d " " -f2 >> historique
    fi
done

datemisejour=`date "+%s"`
echo $datemisejour > datemj
