#!/bin/sh

set -eux

FILE=/var/tmp/last-pkg-update
LOG=/var/log/pkg-update.log

if [ -z "$update_after_time" ];then
    echo "update_after_time var not set, aborting" >> $LOG
fi

if [ -e $FILE ];then
    old_time=$(<$FILE)
else
    old_time=0
fi

if [ $update_after_time -gt $old_time ];then
    echo "running update" >> $LOG
else
    echo "running rollback" >> $LOG
fi

$update_after_time > $FILE
