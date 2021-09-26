#!/usr/bin/env bash
#===============================================================================
#
#          FILE: getopts.sh
#
#         USAGE: ./getopts.sh
#
#   DESCRIPTION: Setup user input arguments by name
#
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 09/22/21 10:14:13
#      REVISION:  ---
#===============================================================================

set -o nounset                                  # Treat unset variables as an error

## Default values
verbose=0
filename=

# List options the program with accept
# Optioins that take arguments are followed by a colon
optstring=f:v

# Loop calls getopts until there are no more options to parse
# Each option is stored in $opt, any option arguments are strored in OPTARG
while getopts $optstring opt
do
	case $opt in
		f) filename=$OPTARG  ## $OPTARG contains the arguments
			;;
		v) verbose=$(( $verbose + 1 ))
			;;
		*) exit 1
			;;
	esac
done
# Remove options from command line
# $OPTIND ponints to the next, unparsed argument
shift "$(( $OPTIND - 1 ))"


# Check whether a filename was entered 
if [[ -n $filename ]]
then
    if [[ $verbose -gt 0 ]]
    then
        printf "Filename is %s\n" "$filename"
    fi
else
    if [[ $verbose -gt 0 ]]
    then
        printf "No filename entered\n" >&2
    fi
    exit 1
fi

exit 0
