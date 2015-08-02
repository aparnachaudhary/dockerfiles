#!/bin/bash

export HOST_CONFIG_HOME="/opt/jboss/wildfly/domain/configuration"

#Add user & Change password => user : demo, password : demo
export username='demo'
export default_password=$(cat -n $HOST_CONFIG_HOME/host-slave.xml |grep secret|awk '{print $3}'|cut -d\" -f2)
export new_password='ZGVtbw=='

echo ${as_is}
sed -e "s/$default_password/$new_password/g" -i  $HOST_CONFIG_HOME/host-slave.xml

#export add_username='demo'
#export user_line_no=$(cat -n $HOST_CONFIG_HOME/host-slave.xml|grep -i 'remote host'|awk '{print $1}')

#echo sed -e "${user_line_no}s/static-discovery/${username}/g" $HOST_CONFIG_HOME/host-slave.xml
#sed -e "${user_line_no}s/static-discovery/static-discovery username='${username}'/g" -i $HOST_CONFIG_HOME/host-slave.xml
