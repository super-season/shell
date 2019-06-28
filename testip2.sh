#!/bin/bash
myping(){
for i in `seq $1 $2`
do
  ping -w0.5 -c2 -i0.1 176.130.4.$i &> /dev/null
if [ $? -eq 0 ] ;then
echo "176.130.4.$i is up"
else
echo "176.130.4.$i is down"
fi
done
}
myping $1 $2 &
