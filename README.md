# jenkins-demo

## Generate SSH remote_host as remote-key
```shell
ssh-keygen -t rsa -m PEM -f remote-key
```

## Build containers
```shell
docker compose up --build   
```
## Exec login bash
```shell
docker exec -it jenkins bash
docker exec -it db bash
docker exec -it remote-host
```

## DumpSQL
```shell
mysqldump -uroot -h db_host -p testdb > /tmp/db.sql
# password 1234test
```
## Config AWS CLI
```shell
$ export AWS_ACCESS_KEY_ID={YOUR_KEY}
$ export AWS_SECRET_ACCESS_KEY={YOUR_KEY}
$ export AWS_DEFAULT_REGION=ap-southeast-1
```

## Config Git-Server
```shell
export GITLAB_HOME=/srv/gitlab
```
Visit the GitLab URL, username root and the password from the following command:
```shell
docker exec -it git-server grep 'Password:' /etc/gitlab/initial_root_password
# The password file will be automatically deleted in the first reconfigure run after 24 hours.
```
Password: abxdNVEsBSRV4NWh9bkfzPR+MMAgIXmPcXt8Q5qE+JQ=

## Create User
![create_user](pic/Screenshot%20from%202022-11-14%2020-14-40.png)
Login and Change Password

## Local DNS clone
```shell
git clone http://gitlab.yeahbutstill.badass.world:8090/jenkins/maven.git
# with username and password
git clone http://{USERNAME}:{PASSWORD}@gitlab.yeahbutstill.badass.world:8090/jenkins/maven.git
```
## Set tmp env
```shell
$ export BUILD_TAG=1.2.1
$ export IMAGE=mayhome-project
$ export PASS={your_password}
   
$ export IMAGE=$(sed -n '1p' /tmp/.auth)
$ export TAG=$(sed -n '2p' /tmp/.auth)
$ export PASS=$(sed -n '3p' /tmp/.auth)
```
## Publish
```shell
#!/bin/bash

export IMAGE=$(sed -n '1p' /tmp/.auth)
export TAG=$(sed -n '2p' /tmp/.auth)
export PASS=$(sed -n '3p' /tmp/.auth)

docker login -u 2819930922 -p $PASS
cd /home/prod_user1/maven && docker-compose up -d
```