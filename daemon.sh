#!/bin/bash
# author:qiaomu
# name: daemon.sh  启动守护进程
# date:2015/6/25	

daemon_conf="/APP/daemon/app.config"		# 守护程序配置文件
while true 
do
	cat ${daemon_conf} | grep -v "^#" | while read is_on app_dir app_name
	do
		if [[ ${is_on} = "on" ]]; then	
			cd ${app_dir}
			NUM=$(ps -ef | grep "java -jar ${app_name}" | grep -v "grep" | wc -l)  
			if [ ${NUM} -lt 1 ]; then #如果没有启动就启动该jar包
				java -jar ${app_name} > /dev/null 2>&1 &
			fi
		fi
	done
	sleep 5
done
