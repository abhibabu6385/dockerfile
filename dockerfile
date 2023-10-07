#remove an existing folder 
sudo rm -rf app1
#make directory
sudo mkdir -m 777 app1
#get into inside of the folder
sudo cd app1
#copy the war file from package to app folder
sudo cp /var/lib/jenkins/workspace/Package/target/adressbook.war .
#create docker file
touch dockerfie
echo "#choose container base OS
FROM centos:latest
#define author name
MAINTAINER "abhi"
#update the container, install java,git,wget
RUN yum update -y && yum install java-1.8* -y && yum install git -y && yum install wget -y
#download the tar file 
ADD https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.80/bin/apache-tomcat-9.0.80.tar.gz /opt
#extract the tar file 
RUN tar -zxvf /opt/apache-tomcat-9.0.80.tar.gz
#keep the war file in deployment path of apachee tomcat
COPY addressbook.war /opt/apache-tomcat-9.0.80/webapps
#configuring the port number
EXPOSE 8080" >> dockerfile
sudo docker build -t app:v1 .