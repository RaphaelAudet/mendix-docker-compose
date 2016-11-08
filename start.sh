#!/bin/bash

set -exu

CONFIG_FILE=/srv/mendix/.m2ee/m2ee.yaml

APP_PING_PORT=8000
APP_PING_PERIOD=60

sed -i "s/DATABASETYPE/$DATABASETYPE/" $CONFIG_FILE
sed -i "s/DATABASEHOSTNAME/$DATABASEHOSTNAME/" $CONFIG_FILE
sed -i "s/DATABASE_DB_NAME/$DATABASE_DB_NAME/" $CONFIG_FILE
sed -i "s/DATABASEUSERNAME/$DATABASEUSERNAME/" $CONFIG_FILE
sed -i "s/DATABASEPASSWORD/$DATABASEPASSWORD/" $CONFIG_FILE

m2ee --yolo unpack application.mda
m2ee download_runtime
m2ee --yolo start

while [ `nc -z 127.0.0.1 $APP_PING_PORT  && echo $? || echo $?` -eq 0 ]
do
    echo app is running, sleeping for $APP_PING_PERIOD
    sleep $APP_PING_PERIOD
done
