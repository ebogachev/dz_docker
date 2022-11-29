FROM ubuntu:18.04
RUN apt update
RUN apt-get -y install git default-jdk maven tomcat9
RUN cd /tmp
RUN git clone https://github.com/koddas/war-web-project.git
RUN cd /tmp/war-web-project
RUN mvn package
RUN cp wwp-1.0.0.war /var/lib/tomcat9/webapps/
