#!/usr/bin/env bash

#name of dir to check is $1 (input param)
dir=$1

echo "Checking $dir in $PWD"

if [[ ! -d $dir ]]
then
    echo "Directory $dir does not exist"
    mkdir -p $dir/data{00..09}
else
    echo "Directory $dir exists"
fi

exit 0
