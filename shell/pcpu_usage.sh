#!bin/bash
#Progrem:
#  计算1个小时内进程cpu的使用情况   
#History:
#2015/12/11 Lily First release
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin
export PATH

SECS=3600
UNIT_TIME=60

#将SECS更改成需要需要监视的总秒数
#UNIT_TIME是取样的时间间隔，单位是秒

STEPS=$(($SECS/$UNIT_TIME))

echo "Watching CPU usage..."

for((i=0;i<STEPS;i++))
do 
	ps -eo comm,pcpu |tail -n +2 >>/tmp/cpu_usage.$$
	sleep $UNIT_TIME
done

echo 
echo CPU eaters:

cat /tmp/cpu_usage.$$ |\
awk '
{ process[$1]+=$2 }
END{
	for(i in process)
	{
		printf("%-20s %s\n",i,process[i]);
	}
}' | sort -nrk 2 | head
 
rm /tmp/cpu_usage.$$

