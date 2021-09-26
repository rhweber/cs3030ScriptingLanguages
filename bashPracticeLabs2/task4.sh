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
name=""
times=0


#---  FUNCTION  ----------------------------------------------------------------
#          NAME:  usage
#   DESCRIPTION:  Program usage
#    PARAMETERS:  None
#       RETURNS:  Error Code 1
#-------------------------------------------------------------------------------
usage ()
{
    echo "Usage $0 [ -n NAME ] [ -t TIMES ]" 1>&2
    exit 1
}	# ----------  end of function usage  ----------

# List options the program with accept
# Optioins that take arguments are followed by a colon
optstring=n:t:h

# Loop calls getopts until there are no more options to parse
# Each option is stored in $opt, any option arguments are strored in OPTARG
while getopts $optstring opt
do
	case $opt in
		n) name=$OPTARG  ## $OPTARG contains the arguments
			;;
		f) times=$OPTARG
			;;
        h)
            usage
            ;;
		\?) echo "Invalid choice"
			;;
	esac
done
# Remove options from command line
# $OPTIND ponints to the next, unparsed argument
shift "$(( $OPTIND - 1 ))"

exit 0
