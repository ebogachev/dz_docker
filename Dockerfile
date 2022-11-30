FROM ubuntu:18.04
RUN apt update
RUN apt-get -y install git default-jdk maven wget
RUN mkdir /usr/local/tomcat
RUN wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.69/bin/apache-tomcat-9.0.69.tar.gz -O /tmp/tomcat.tar.gz
RUN cd /tmp && tar xvfz tomcat.tar.gz
RUN cp -Rv /tmp/apache-tomcat-9.0.69/* /usr/local/tomcat/
RUN git clone https://github.com/koddas/war-web-project.git
WORKDIR /war-web-project
RUN mvn package
RUN cp /tmp/war-web-project/target/wwp-1.0.0.war /usr/local/tomcat/webapps/
EXPOSE 8080
CMD ["/usr/local/tomcat/bin/catalina.sh", "run"]