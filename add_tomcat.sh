#!/bin/bash
# author:qiaomu
# name: add_tomcat.sh  新增tomcat脚本
# date:2015/3/30
# $1: service_name
# $2: service_port
# $3: shutdown_port

tomcat_root_dir="/tomcat" #tomcat root dir
tomcat_model_dir='/usr/local/apache-tomcat-7.0.42'		# tomcat模板路径
add_tomcat_dir="${tomcat_root_dir}/tomcat_$1_$2"		# tomcat目录
tomcat_conf_file="${add_tomcat_dir}/conf/server.xml"	# tomcat主配置文件
rclocal_dir="/home/tomcat"								# 开机自启动脚本路径
start_tomcat_sh="${add_tomcat_dir}/bin/startup.sh"

#if not exists make tomcat root dir  
if [ ! -d "${add_tomcat_dir}" ]
then 
	mkdir "${add_tomcat_dir}"
	# copy tomcat_model
	cp -r ${tomcat_model_dir}/* ${add_tomcat_dir}
	# change tomcat port
	sed -i -e "/^<Server/s/30000/$3/g" -e "/<Connector/s/10000/$2/g" ${tomcat_conf_file}
	# 判断是否成功，返回结果
	[ $? = 0 ] && echo "add tomcat $1 success"
	# 把tomcat加入到开机启动中
	echo "su tomcat ${start_tomcat_sh}" >> ${rclocal_dir}/rclocal.sh
fi
