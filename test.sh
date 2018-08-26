#!/bin/bash

if [ $#  -eq 0 ]
 	then 
 		echo "No arguments passed"
fi


R2_TEST_URL="https://etm18r2test.etouchmenu.net"
R2_QA_URL="https://etm18r2qa.etouchmenu.net"
CX3_URL="https://caesars.etouchmenu.net"
LIVE_URL="https://live.etouchmenu.net"
E18R2_URL="https://emenu18r2.etouchmenu.net"

# declare -a SUBURL
SUBURL=("/rm/hello" "/tm/hello" "/um/hello" "/sd/hello" "/checkservicelife")

createUrlForServer() {
	printf "%-40s %s\n" "Server Name :"  "$1"

	for i in "${SUBURL[@]}"
	do
		myip=$(curl $1$i -s)
		printf "%-40s %s\n" "$i"   "$myip"
	done
}

while test $# -gt 0
do
		case "$1" in
			"r2test") createUrlForServer $R2_TEST_URL
			;;
			"r2qa") createUrlForServer $R2_QA_URL
			;;
			"cx3") createUrlForServer $CX3_URL
			;;
			"live") createUrlForServer $LIVE_URL
			;;
			"emenu18r2") createUrlForServer $E18R2_URL
			;;
		esac
		shift
done
