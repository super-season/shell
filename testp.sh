#!/bin/bash
num=0
for i in `seq $1 $2`
do
  ping -w0.5 -i0.1 -c2 176.130.4.$i > /dev/null
if [ $? -eq 0 ] ; then
  echo -e "176.130.4.$i is up"
  let num++
else
  echo -e "176.130.4.$i is down"
fi
done
echo "有${num}台主机在线!"
