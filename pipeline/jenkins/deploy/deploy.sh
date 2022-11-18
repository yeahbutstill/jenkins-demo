#!/bin/bash

echo mayhome-project > /tmp/.auth
echo $BUILD_TAG >> /tmp/.auth
echo $PASS >> /tmp/.auth

scp -i /opt/prod1 /tmp/.auth prod_user1@172.19.0.7:/tmp/.auth 
scp -i /opt/prod1 ./jenkins/deploy/publish prod_user1@172.19.0.7:/tmp/publish
docker exec -it prod-host1 bash "./tmp/publish"
