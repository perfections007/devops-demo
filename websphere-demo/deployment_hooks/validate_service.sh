#!/bin/bash
echo "validate_service.sh"

export WAS_PATH=/ztsoft/usr/wasadm/profiles/defaultapp01Node/bin
user=wasadm
psword=ibmadm

processesNum=`bash $WAS_PATH/wsadmin.sh -port 8880 -user $user -password $psword -lang jython -c "print len(AdminControl.queryNames('type=Application,name=websphere-demo-song,*'))"|tail -1`

if [ "$processesNum" -gt "0" ];then
    exit 0
else 
    exit 1
fi

