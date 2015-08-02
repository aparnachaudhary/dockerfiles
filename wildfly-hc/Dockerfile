#
# WildFly9 Dockerfile
#
# Pull the JDK base image

FROM jboss/base-jdk:8

MAINTAINER Aparna Chaudhary

# Set the WILDFLY_VERSION env variable
ENV WILDFLY_VERSION 9.0.0.Final

# Add the WildFly distribution to /opt, and make wildfly the owner of the extracted tar content
# Make sure the distribution is available from a well-known place
RUN cd $HOME && curl http://download.jboss.org/wildfly/$WILDFLY_VERSION/wildfly-$WILDFLY_VERSION.tar.gz | tar zx && mv $HOME/wildfly-$WILDFLY_VERSION $HOME/wildfly

# Set the JBOSS_HOME env variable
ENV JBOSS_HOME /opt/jboss/wildfly

# Create User.
RUN $JBOSS_HOME/bin/add-user.sh demo demo --silent

# Copy the script to change the default password
COPY set_password.sh $JBOSS_HOME/bin

# Execute the script
RUN $JBOSS_HOME/bin/set_password.sh

EXPOSE 8080 9990 9999

CMD ["/opt/jboss/wildfly/bin/domain.sh", "-b", "0.0.0.0", "-bmanagement", "0.0.0.0", "--host-config", "host-slave.xml"]
