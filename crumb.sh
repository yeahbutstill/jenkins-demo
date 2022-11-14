curl -v -X GET "http://yeahbutstill.badass.world:8080/crumbIssuer/api/json" --user dani:1234
curl -X POST "http://yeahbutstill.badass.world:8080/job/ENV/build" --user dani:1234 -H 'Jenkins-Crumb: '
curl -X POST "http://yeahbutstill.badass.world:8080/job/backup-to-aws/buildWithParameters?MYSQL_HOST=db_host&DATABASE_NAME=testdb&AWS_BUCKET_NAME=jenkins-mysql-backup-october-2022" --user dani:1234 -H 'Jenkins-Crumb: '
