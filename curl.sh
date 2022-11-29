#!/bin/bash

function usage() {
echo "Usage:  $0 count delay host path"
echo "Example: $0 10 0.1 mytestserver.net heatlh";
}

if [ $# -ne 4 ]; then
usage;
exit;
fi

count=$1
delay=$2
host=$3
path=$4


let i=$count-1
tot=0
while [ $i -ge 0 ];
do
res=`curl -w "$i: %{time_total} %{http_code} %{size_download} %{url_effective}\n" -o "/dev/null" -s http://${host}/${path}`
echo $res
val=`echo $res | cut -f2 -d' '`
tot=`echo "scale=3;${tot}+${val}" | bc`
let i=i-1
sleep $delay
done

avg=`echo "scale=3; ${tot}/${count}" |bc`
echo "   ........................."
echo "   AVG: $tot/$count = $avg"
