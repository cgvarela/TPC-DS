#!/bin/bash
set -e

update_config="0"

#check optimizer
counter=`gpconfig -s optimizer | grep Master | grep on | wc -l`
if [ "$counter" -eq "0" ]; then
	echo "enabling optimizer"
	gpconfig -c optimizer -v on --masteronly
	update_config="1"
fi

#check analyze_root_partition
counter=`gpconfig -s optimizer_analyze_root_partition | grep Master | grep on | wc -l`
if [ "$counter" -eq "0" ]; then
	echo "enabling analyze_root_partition"
	gpconfig -c optimizer_analyze_root_partition -v on --masteronly
	update_config="1"
fi

if [ "$update_config" -eq "1" ]; then
	echo "update cluster because of config changes"
	gpstop -u
fi
