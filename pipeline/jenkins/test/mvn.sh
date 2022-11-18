#!/bin/bash

echo "***************************"
echo "** Testing the code ***********"
echo "***************************"

WORKSPACE=/home/yeahbutstill/jenkins-data/jenkins_home/workspace/pipeline-docker-maven
docker run -it --rm -v $WORKSPACE/java-app:/app -v /root/.m2/:/root/.m2/ -w /app maven:latest "$@"
