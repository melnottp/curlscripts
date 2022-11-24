#!/bin/bash

function usage() {
echo "Usage:  $0 count delay host1 port1 host2 port2"
echo "Example: $0 10 0.1 mytestserver.net 80 mytestserver.net 81";
}

# check number of parameters
if [ $# -ne 6 ]; then
usage;
exit;
fi

# assign parameters to variables
count=$1
delay=$2
host1=$3
path1=$4
host2=$5
path2=$6

# take the dns hit here
curl -w "$i: %{time_total} %{http_code} %{size_download} %{url_effective}\n" -o "/dev/null" -s http://${host1}/${path1} &> /dev/null
curl -w "$i: %{time_total} %{http_code} %{size_download} %{url_effective}\n" -o "/dev/null" -s http://${host2}/${path2} &> /dev/null

div="==================================================================="

# print commands to be run
printf "%s%s\n" $div $div
com1="$count: curl -s http://${host1}/${path1}"
com2="$count: curl -s http://${host2}/${path2}"
printf "%s\t\t%s\n" "$com1" "$com2"
printf "%s%s\n" $div $div

# perform tests
let i=$count-1
tot1=0
tot2=0
while [ $i -ge 0 ];
do
# tests for host1
res1=`curl -w "$i: %{time_total} %{speed_download} %{http_code} %{size_download} %{url_effective}\n" -o "/dev/null" -s http://${host2}/${path1}`
val1=`echo "${res1}" | cut -f2 -d' '`
tot1=`echo "scale=3;${tot1}+${val1}" | bc`

# tests for host2
res2=`curl -w "$i: %{time_total} %{speed_download} %{http_code} %{size_download} %{url_effective}\n" -o "/dev/null" -s http://${host2}/${path2}`
val2=`echo "${res2}" | cut -f2 -d' '`
tot2=`echo "scale=3;${tot2}+${val2}" | bc`

printf "%s\t%s\n" "$res1" "$res2"

let i=$i-1
sleep $delay
done

# print summary
avg1=`echo "scale=3; ${tot1}/${count}" |bc`
avg2=`echo "scale=3; ${tot2}/${count}" |bc`
printf "%s%s\n" $div $div
printf "%s\t\t\t\t\t\t\t%s\n" "AVG: ${tot1}/$count = ${avg1}" "AVG: ${tot2}/$count = ${avg2}"
