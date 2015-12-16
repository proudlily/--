#!bin/bash
#Progrem:
#   a:
#	   1.创建用户
#	   2.将用户添加进组
#	   3.创建目录
#	   4.给目录添加权限
#	b:开启samba的服务
#		1.配置/etc/samba/smb.conf
#		2.开启samba的服务
#		3.测试
#	c:关闭防火墙
#
#History:
#2015/11/30 Lily First release
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin
export PATH

#a:
#创建用户组
groupadd User
#创建用户并添加进组
useradd sisi -G User
#创建目录
cd /home
touch User
#给目录添加组所有权
chgrp User /home/sambai
#给目录添加权限
chmod 2775 /home/samba
#创建samba的帐号
smbpasswd -a sisi




#b:开启samba的服务
systemctl enable smb.service
systemctl enable nmb.service

systemctl start smb.service
systemctl start nmb.service
#c: 关闭防火墙
rcSuSEfirewall2 stop
