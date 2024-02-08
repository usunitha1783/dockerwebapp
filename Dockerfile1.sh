FROM centos
MAINTAINER ravindra ravindra.devops@gmail.com
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
RUN yum install -y java
RUN yum install wget -y
RUN yum install vim -y
RUN mkdir /opt/Tomcat
WORKDIR /opt/Tomcat
RUN curl -O https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.73/bin/apache-tomcat-9.0.73.tar.gz
RUN tar -xvzf apache*.tar.gz
RUN mv apache-tomcat-9.0.73/* /opt/Tomcat
RUN java -version
WORKDIR /opt/Tomcat/webapps
COPY cloudgen-1.war /opt/Tomcat/webapps/
EXPOSE 8080
CMD ["/opt/Tomcat/bin/startup.sh", "run"]
#FROM centos
#MAINTAINER ravindra ravindra.devops@gmail.com
#RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
#RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
#RUN mkdir /opt/Tomcat
#WORKDIR /opt/Tomcat
#RUN curl -O https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.73/bin/apache-tomcat-9.0.73.tar.gz
#RUN tar -xvzf apache*.tar.gz
#RUN mv apache-tomcat-9.0.73/* /opt/Tomcat
#RUN yum install -y java
#RUN yum install wget -y
##RUN yum install vim -y
#RUN java -version
#WORKDIR /opt/Tomcat/webapps
#COPY cloudgen.war /opt/Tomcat/webapps/
#EXPOSE 8080
#CMD ["/opt/Tomcat/bin/startup.sh", "run"]