#!/bin/bash
bgdir=/root/图片/wallhaven
while :
 do
  for i in {1..13}
    do
      gsettings set org.gnome.desktop.background picture-uri "file:${bgdir}${i}.jpg"
      sleep 300
    done
done &
