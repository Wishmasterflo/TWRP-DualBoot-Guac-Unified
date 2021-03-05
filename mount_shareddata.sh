#!/system/bin/sh
if [ -d /datacommon/SharedData ]; then
  if [ -f /datacommon/SharedData/datamount.conf ]; then
    echo GO
    setenforce 0
    while IFS="" read -r i || [ -n "$i" ]; do
      echo $i
      mount -o bind $i
      stringarray=($i)
      echo ${stringarray[1]}
      restorecon -R ${stringarray[1]}
      done < /datacommon/SharedData/datamount.conf
    chmod -R 777 /datacommon/SharedData/*
  fi  
fi
exit 0