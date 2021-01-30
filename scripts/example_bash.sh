#!/bin/bash

if (($# == 0)); then
    echo "Please pass arguments -t <task1><task2>... -d <date>.."
    exit 2
fi

while getopts ":t:d:" opt; do
    case $opt in
        t)
            echo "-t was triggered, Parameter: $OPTARG" >&2
            TASKS=$OPTARG
            ;;
        d)
            echo "-d was triggered, Parameter: $OPTARG" >&2
            RDATE=$OPTARG
            ;;
        \?)
            echo "Invalid option: -$OPTARG" >&2
            exit 1
            ;;
        :)
            echo "Option -$OPTARG requires an argument." >&2
            exit 1
            ;;
    esac
done
echo "Go thru selection"
for TASK in $TASKS;
do
    if [ "$TASKS" == "d1" ]
    then
        echo "Inside the d1"
        echo -n "Choose option p-partial, hit enter for all >"
        read DType
        echo "You have choosen $DType"

    fi
    echo "Task: $TASK"
done

##Check Date
date "+%Y-%m-%d" -d "$RDATE" > /dev/null  2>&1
if [ $? != 0 ]
then
	echo Start date $start is NOT a valid YYYY-MM-DD date
	exit 1
fi
