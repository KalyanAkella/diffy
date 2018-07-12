#!/bin/bash

DIFFY_DIR=.
CANDIDATE=10.33.53.8:41414
PRIMARY=10.32.2.11:40404
SECONDARY=10.32.13.24:40404
PROXY_PORT=40404
ADMIN_PORT=48889
HTTP_PORT=48888
SERVICE_NAME=Athena
ROOT_URL=localhost:$HTTP_PORT

if [ "$1" = "start" ];
then

    echo "Starting Diffy" && \
    java -jar $DIFFY_DIR/diffy-server.jar \
    -candidate="$CANDIDATE" \
    -master.primary="$PRIMARY" \
    -master.secondary="$SECONDARY" \
    -service.protocol='http' \
    -serviceName="$SERVICE_NAME" \
    -proxy.port=:$PROXY_PORT \
    -admin.port=:$ADMIN_PORT \
    -http.port=:$HTTP_PORT \
    -allowHttpSideEffects=true \
    -rootUrl="$ROOT_URL" & \

    sleep 3
    echo "Wait for server to deploy"
    sleep 2

    echo "Your Diffy UI can be reached at http://$ROOT_URL"

fi
