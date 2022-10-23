#!/bin/bash

cpu_user=$(iostat | awk 'FNR == 4 { print $1 }')
cpu_nice=$(iostat | awk 'FNR == 4 { print $2 }')
cpu_system=$(iostat | awk 'FNR == 4 { print $3 }')
cpu_iowait=$(iostat | awk 'FNR == 4 { print $4 }')
cpu_steal=$(iostat | awk 'FNR == 4 { print $5 }')
cpu_idle=$(iostat | awk 'FNR == 4 { print $6 }')

mem_total=$(free --kilo | awk 'FNR == 2 {print $2}')
mem_used=$(free --kilo | awk 'FNR == 2 {print $3}')
mem_free=$(free --kilo | awk 'FNR == 2 {print $4}')
mem_shared=$(free --kilo | awk 'FNR == 2 {print $5}')
mem_buff_cache=$(free --kilo | awk 'FNR == 2 {print $6}')
mem_available=$(free --kilo | awk 'FNR == 2 {print $7}')

echo "# TYPE cusnode_cpu_percent_total gauge"
echo "cusnode_cpu_percent_total{mode=\"user\"} $cpu_user"
echo "cusnode_cpu_percent_total{mode=\"nice\"} $cpu_nice"
echo "cusnode_cpu_percent_total{mode=\"system\"} $cpu_system"
echo "cusnode_cpu_percent_total{mode=\"iowait\"} $cpu_iowait"
echo "cusnode_cpu_percent_total{mode=\"steal\"} $cpu_steal"
echo "cusnode_cpu_percent_total{mode=\"idle\"} $cpu_idle"

echo

echo "# TYPE cusnode_memory_kilobytes gauge"
echo "cusnode_memory_kilobytes{mode=\"total\"} $mem_total"
echo "cusnode_memory_kilobytes{mode=\"used\"} $mem_used"
echo "cusnode_memory_kilobytes{mode=\"free\"} $mem_free"
echo "cusnode_memory_kilobytes{mode=\"shared\"} $mem_shared"
echo "cusnode_memory_kilobytes{mode=\"buff_cache\"} $mem_buff_cache"
echo "cusnode_memory_kilobytes{mode=\"available\"} $mem_available"

echo 

echo "# TYPE cusnode_disk_capacity_kilobytes gauge"
for ((i = 2 ; i < 100; i++));
do
    if [ -z "$(df | awk 'FNR == '$i' {print $1}')" ]
    then
        break
    fi
    echo "cusnode_disk_capacity_kilobytes{device=\"$(df | awk 'FNR == '$i' {print $1}')\",mounted=\"$(df | awk 'FNR == '$i' {print $6}')\"} $(df | awk 'FNR == '$i' {print $2}')"
done
