# Use latest jboss/base-jdk:7 image as the base
FROM jboss/base-jdk:7

# Download and extract the JBoss distribution to /opt
RUN cd $HOME && curl http://download.jboss.org/jbossas/7.1/jboss-as-7.1.1.Final/jboss-as-7.1.1.Final.tar.gz | tar zx && ln -s $HOME/jboss-as-7.1.1.Final $HOME/jboss-as

# Set the JBOSS_HOME env variable
ENV JBOSS_HOME /opt/jboss/jboss-as

# Expose the ports we're interested in
EXPOSE 8080 9990

# Set the default command to run on boot
# This will boot WildFly in the standalone mode and bind to all interface
CMD ["/opt/jboss/jboss-as/bin/standalone.sh", "-b", "0.0.0.0"]
