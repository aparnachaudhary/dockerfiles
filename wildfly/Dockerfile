#
# WildFly9 Dockerfile
#
# Pull the JDK base image

FROM jboss/base-jdk:8

MAINTAINER Aparna Chaudhary

# Set the WILDFLY_VERSION env variable
ENV WILDFLY_VERSION 9.0.0.Beta2

# Add the WildFly distribution to /opt, and make wildfly the owner of the extracted tar content
# Make sure the distribution is available from a well-known place
RUN cd $HOME && curl http://download.jboss.org/wildfly/$WILDFLY_VERSION/wildfly-$WILDFLY_VERSION.tar.gz | tar zx && mv $HOME/wildfly-$WILDFLY_VERSION $HOME/wildfly

# Set the JBOSS_HOME env variable
ENV JBOSS_HOME /opt/jboss/wildfly

# Set the default command to run on boot
# This will boot WildFly in the standalone mode and bind to all interface
# CMD ["/opt/jboss/wildfly/bin/standalone.sh", "-b", "0.0.0.0"]

# Define default command.
CMD ["bash"]
