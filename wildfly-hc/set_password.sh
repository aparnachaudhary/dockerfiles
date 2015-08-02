#!/bin/bash

#Add user & Change password => user : demo, password : demo
export username='demo'
export default_password=$(cat -n ./host-slave.xml |grep secret|awk '{print $3}'|cut -d\" -f2)
export new_password='ZGVtbw=='

echo ${as_is}
sed -e "s/$default_password/$new_password/g" -i  /opt/jboss/wildfly/domain/configuration/host-slave.xml

export add_username='demo'
export user_line_no=$(cat -n ./host-slave.xml|grep -i 'remote host'|awk '{print $1}')

echo sed -e "${user_line_no}s/remote/${username}/g" host-slave.xml
sed -e "${user_line_no}s/remote/remote username='${username}'/g" -i host-slave.xml
