#!/bin/bash
echo "-----------------------------------------------------------------"
echo -ne "OS "
egrep '^(NAME)=' /etc/os-release
echo "-----------------------------------------------------------------"
echo "Min   CPU(%)   Free Memory(%)  Used Memory(%)  Cached Memory(%)"
echo "-----------------------------------------------------------------"

for ((i=1;i<=5;i++));
do
cpu=$(cat /proc/stat | awk '/cpu/{printf("%.2f%\n"), ($2+$4)*100/($2+$4+$5)}' |  awk '{print $0}' | head -1)
free_mem=$(free | awk '/Mem/{printf("%.2f%"), $4/$2*100}')
used_mem=$(free | awk '/Mem/{printf("%.2f%"), $3/$2*100}')
cached_mem=$(free | awk '/Mem/{printf("%.2f%"), $6/$2*100}')
echo "$i     $cpu   $free_mem           $used_mem          $cached_mem"
sleep 60
done 

echo "-----------------------------------------------------------------"
