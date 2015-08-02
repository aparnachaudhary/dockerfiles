#
# WildFly HC Dockerfile
#
# Pull the WildFly base image

FROM jboss/wildfly:9.0.1.Final

MAINTAINER Aparna Chaudhary

# Create User.
RUN $JBOSS_HOME/bin/add-user.sh demo demo --silent

# Copy the script to change the default password
COPY set_password.sh /opt/jboss/wildfly/bin

# Execute the script
RUN /opt/jboss/wildfly/bin/set_password.sh

EXPOSE 8080 9990 9999

CMD ["/opt/jboss/wildfly/bin/domain.sh", "-b", "0.0.0.0", "-bmanagement", "0.0.0.0", "--host-config", "host-slave.xml"]
