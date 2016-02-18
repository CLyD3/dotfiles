# basic calc function
? () { echo "$*" | bc -l; }

#number system conversion
nsconv() { echo "obase=$1;$2" | bc; }

