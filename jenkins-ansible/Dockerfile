FROM jenkins/jenkins

USER root

RUN apt-get update -y 
RUN apt-get install python3-pip -y
RUN apt-get install software-properties-common -y
RUN apt-get install ansible -y
RUN apt-get install vim -y

USER jenkins
