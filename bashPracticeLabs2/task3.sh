#!/usr/bin/env bash

help()
{
    echo 'Usage: $0 lname_letter'
    exit 1
}

echo "Checking $dir in $PWD"

if [[ $# -ne 1 ]]
then
    help $0
fi

# destination folder
dest='/home/hugo-wsu/data'
# username
user='rh87421'
# server name
server='icarus.cs.weber.edu'

# Program begins
lname=$1
# get timestamp YY-MM-DD
ts=`date +%y-%m-%d`  #execute with backtick `
# output file name
ofile=${user}_${lname}_people_${ts}.txt

echo $ofile

# filer data
cat test_passwd | 
    grep '^[a-z][s]' | 
    grep 'home' | 
    cut -d ':' -f 1,6 | 
    sort > $ofile
# scp file
scp $ofile ${user}@${server}:${dest}

exit 0
