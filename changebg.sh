#!/bin/bash
#该程序为自动切换壁纸，是一个死循环，可用ps命令看到changebg.sh的任务，用killall -9 changebg.sh 或者命令kill pid号来停止进程
#图片路径要根据自己的图片存放路径来
while :
do
gsettings set org.gnome.desktop.background picture-uri "file:/root/图片/wallhaven-962vew.jpg"
sleep 600
gsettings set org.gnome.desktop.background picture-uri "file:/root/图片/wallhaven-651880.jpg"
sleep 600
gsettings set org.gnome.desktop.background picture-uri "file:/root/图片/wallhaven-ymge5x.jpg"
sleep 600
gsettings set org.gnome.desktop.background picture-uri "file:/root/图片/wallhaven-dgeqoj.jpg"
sleep 1200
gsettings set org.gnome.desktop.background picture-uri "/root/图片/wallhaven-83o1x2.jpg"
sleep 1200
sleep 1200gsettings set org.gnome.desktop.background picture-uri "/root/图片/wallhaven-373939.jpg"
sleep 1200
gsettings set org.gnome.desktop.background picture-uri "/root/图片/wallhaven-kwkg5q.jpg"
sleep 1200
gsettings set org.gnome.desktop.background picture-uri "/root/图片/wallhaven-zmo8ry.jpg"
sleep 600
done &


