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
RUN /opt/jboss/wildfly/bin/add-user.sh demo demo --silent

EXPOSE 8080 9990 9999

CMD ["/opt/jboss/wildfly/bin/domain.sh", "-b", "192.168.59.103", "-bmanagement", "192.168.59.103", "--host-config", "host-master.xml"]
