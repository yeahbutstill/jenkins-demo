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
$ export AWS_ACCESS_KEY_ID=AKIAIOSFODNN7EXAMPLE
$ export AWS_SECRET_ACCESS_KEY=wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY
$ export AWS_DEFAULT_REGION=ap-southeast-1
```