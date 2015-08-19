#!/bin/bash
# author:qiaomu
# date:2015/3/30
# name: restart_tomcat.sh  重启tomcat
# $1: service_name
# $2: service_port

tomcat_dir="/tomcat/tomcat_$1_$2"		# tomcat目录
start_tomcat_sh="${tomcat_dir}/bin/startup.sh"	# 启动tomcat脚本
stop_tomcat_sh="${tomcat_dir}/bin/shutdown.sh"	# 关闭tomcat脚本
getpid=$(ps aux | grep "/tomcat/tomcat_$1_$2" | grep -v "grep" | awk '{print $2}')

#判断是否有service_name
[ ! -n "$1" ] && echo "service_name is empty"

#判断tomcat是否运行 参数为服务名
function isRun(){
	status=$(ps aux | grep "tomcat_$1_$2" | grep -v grep | wc -l)
	if [[ ${status} = 0 ]]; then
		return 1    #没有运行返回 1
	else
		return 0	#运行返回 0
	fi
}

function restart(){
	${stop_tomcat_sh} > /dev/null
	sleep 0.5
	isRun $1 $2
	if [[ $? -eq 1 ]]; then
		${start_tomcat_sh} > /dev/null
	else
		pid=$(ps aux | grep "/tomcat/tomcat_$1_$2" | grep -v "grep" | awk '{print $2}')
		kill -9 ${pid}
		sleep 0.5
		${start_tomcat_sh} > /dev/null
	fi
}

# 调用restart函数重启tomcat
restart $1 $2
