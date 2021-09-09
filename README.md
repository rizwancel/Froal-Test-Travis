# Froala-Deployment-Files

To deploy all demo application, Please run below command.

1. sh ./DeployFroalaDemoApps.sh deploy

Above command will deploy all the application using docker container. Once it is deployed, demo apps
URLS will be available.

Use machine IP or localhost or 127.0.0.1.

Ember:
http://${IP}:1501/

Node:
http://${IP}:1502/

flask:
http://${IP}:1503/

dotnet:
http://${IP}:1504/

aurelia:
http://${IP}:1505/

angular-froala:
http://${IP}:1506/demo/

vue-froala:
http://${IP}:1508

django:
http://${IP}:1509

knockout:
http://${IP}:1510/demo/

ruby:
http://${IP}:1511

php:
http://${IP}:1512

wordpress:
http://${IP}:1513/wp-admin/plugins.php

yii:
http://${IP}:1514/web/

Ruby-rails:
http://${IP}:1515/editor

meteor:
http://${IP}:1516/

symfony:1
http://10.220.201.231:1517/public/ 

2. To clean all the deployed applications, Run below command.

sh ./DeployFroalaDemoApps.sh clean

