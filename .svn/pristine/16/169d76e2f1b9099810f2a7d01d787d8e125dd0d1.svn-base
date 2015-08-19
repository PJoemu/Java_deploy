#!/bin/bash
# author:yangjiong
# name: kill_app_process.sh 杀死JavaApp进程
# date:2015/6/11
# $1: app_name     			外挂名称
	
app_pid=$(ps aux | grep "$1" | grep -v "grep" | awk '{print $2}')
sleep 1
kill -9 ${app_pid}
echo -e "\033[31m\033[01m --------------$1 stopped-----------------\033[0m"
exit 0