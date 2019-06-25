#!/bin/bash
#部署redis服务器
LANG=en growpart /dev/vda 1 && xfs_growfs /dev/vda1
yum -y install gcc
ss -anutlp | grep redis > /dev/null && /etc/init.d/redis_6379 stop
tar -xf /root/redis-4.0.8.tar.gz
cd /root/redis-4.0.8
make && make install
./utils/install_server.sh
#编译并安装redis服务
sed -i "s/^port .*/port 63${1}/" /etc/redis/6379.conf #更改端口号
sed -i "s/^bind .*/bind 192.168.4.${1}/" /etc/redis/6379.conf #更改绑定ip
sed -i '814a cluster-enabled yes' /etc/redis/6379.conf #允许集群
#sed -ri 's/^# cluster-enabled(.*)/cluster-enabled\1/' /etc/redis/6379.conf #r选项要放在前面，再用i选项
#sed -ri "s/^# cluster-config-file(.*)/cluster-config-file\1/p"  /etc/redis/6379.conf
#sed -nr "s/^# cluster-node-timeout.*/cluster-node-timeout 5000/p"  /etc/redis/6379.conf
sed -i "822a cluster-config-file nodes-63${1}.conf" /etc/redis/6379.conf #设置日志文件名
sed -i '830a cluster-node-timeout 5000' /etc/redis/6379.conf　#设置链接超时
#更改配置文件
/etc/init.d/redis_6379 restart　#重启服务，该服务还是127.0.0.1和6739的端口
sed -i "s/.CLIEXE.*shutdown/\$CLIEXEC -p 63${1} -h 192.168.4.$1 shutdown/" /etc/init.d/redis_6379 
#由于端口和ｉｐ变了，需要更改服务启动程序的值

netstat -anutlp | grep redis
