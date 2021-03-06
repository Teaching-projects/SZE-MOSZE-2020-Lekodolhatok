#!/bin/bash

> test/results.log

declare -a arr=("units/kakarott.json" "units/vakarott.json" "units/makarott.json")

for i in "${arr[@]}"
do
    for j in "${arr[@]}"
    do
        if [[ "$i" != "$j" ]]
        then
            ./a.out "$i" "$j" >> test/results.log
        fi
    done
done

if [ "$(diff "test/results.log" "test/check.txt")" == "" ]; then
    echo "Everything is okay"
    exit 0
else
    echo "Something went wrong :("
    exit 1
fi