#!/bin/bash
# author:qiaomu
# name: change_app_path.sh
# date:2015/3/31
# $1: app_name 				系统英文名称
# $2: app_version_name		外挂服务集英文名称
# $3: deploy_number			部署版本号
# $4: run_number			运行版本号

daemon_conf_file_path="/APP/damon/app.config" #守护程序配置文件路径
app_dim_dir="/srv/JavaApp/$1/$2_version/$1_"  #JavaApp基本路径（模糊匹配路径）
deploy_app_dir="${app_dim_dir}$3"     #部署版本路径
run_app_dir="${app_dim_dir}$4" #运行版本路径
jar_full_name="com.better517na.$1.jar"  #jar包全称

#判断外挂是否加入守护程序配置文件
# $1: 系统英文名称
# $2: 版本路径
# 返回记录数目，如果为0，表示还没有添加，否则已经添加过
function IsExistApp()
{
   is_app_exist=$(cat ${daemon_conf_file_path} | grep $1 | grep $2 | wc -l)
	return $is_app_exist
}


IsExistApp $1 ${app_dim_dir} #调用函数
is_app_exist=$? #得到函数的返回值
if [[ ${is_app_exist} = 0 ]]; then
	#如果没有则直接添加守护信息到守护进程
	echo -e "on \t \t ${deploy_app_dir} \t \t ${jar_full_name}" >> ${daemon_conf_file_path}
else
	#删除以前的守护信息（去掉版本号模糊删除）
	sed -i 's#'${app_dim_dir}'#EXCLUSIVE#;/EXCLUSIVE/d' ${daemon_conf_file_path}
	#添加新的守护信息
	echo -e "on \t \t ${deploy_app_dir} \t \t ${jar_full_name}" >> ${daemon_conf_file_path}
fi

