#!bin/bash
#Progrem:
#      install softwear
#History:
#2015/11/30 Lily First release
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin
export PATH

#gui
sudo zypper install gvim , pidgin , imagewriter , stardict , chromium 

#系统库
sudo zypper install CMake , gcc , gcc-c++ , ncurses-devel , python-devel 

#软件
sudo zypper install git 
sudo zypper install docker


#软件的配置
git config user.name "lily"
git config user.email "annqlm@qq.com"
git clone http://github.com/creationix/nvm.git ~/.nvm
source ~/.nvm/nvm.sh


