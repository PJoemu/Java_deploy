#!/bin/bash
# author:yangjiong
# name: rm_extra_version.sh 删除多余版本文件夹
# date:2015/6/17
# $1: version_path 版本路径
# $2: max_num 保留数量
# $3: rogram_en_name 程序英文名

tempfile="./temp.dat" #临时文件
i=0 #计数
ls -alt $1 | grep $3 | grep ^d > "${tempfile}" #目录按创建时间倒序，同时按程序英文名进行过滤（最新的在前面，按照保留数量删除后面的文件夹），并将排序结果输出到临时文件
cat "${tempfile}" | while read line   #从临时文件按行读取
do 
	# echo $line|cut -d' ' -f8   #输出目录名称
	((i+=1))  #计数
	if [ $i -gt $2 ] 
	then
		cd $1	
		# echo $line|cut -d' ' -f8
		rm -rf $line|cut -d' ' -f8 #删除多余版本文件夹
	fi
done
rm -rf "${tempfile}" #删除临时文件
exit 0
