#!/bin/bash
# author:qiaomu
# name: change_tomcat_path.sh   		路径切换脚本
# date:2015/3/30
# $1: service_name 						程序英文名称
# $2: service_version_name 				服务集英文名称
# $3: service_type {site or service}	服务类型（网站或者服务）
# $4: deploy_number						部署版本号
# $5: service_port                      端口号
# $6: webSite                    站点英文名
tomcat_dir="/tomcat/tomcat_$6_$5"	# tomcat目录 
tomcat_root_dir="${tomcat_dir}/webapps/ROOT"  #tomcat root 目录或文件

rm -rf ${tomcat_root_dir}

#如果存在ROOT软链接，删除原有的软链接，然后重新建立新的软链接
#Java服务： /srv/JavaService/程序英文名/服务集英文名_Versions/程序英文名_部署版本号
#JavaAPP:  /srv/JavaApp/程序英文名/服务集英文名_Versions/程序英文名_部署版本号
#Java网站：/srv/JavaSite/程序英文名/服务集英文名_Versions/程序英文名_部署版本号
if [ -f "${tomcat_root_dir}" ]; then
	rm -f ${tomcat_root_dir}
	sleep 0.5
	ln -s /srv/$3/$1/$2_version/$1_$4 ${tomcat_root_dir}
else  #否则直接建立新的软链接
	ln -s /srv/$3/$1/$2_version/$1_$4 ${tomcat_root_dir}
fi

# 重启tomcat
cd `dirname $0`
. restart_tomcat.sh $6 $5

# 判断是否重启成功
[ $? -eq 0 ] && echo "restart $1_$2 success"
