#!/bin/sh

set -e

cf login --skip-ssl-validation -a $CF_API_ENDPOINT -o $ORG -s $SPACE -u $USERNAME -p $PASSWORD

cf push $APP_NAME -p $GITHUB_WORKSPACE/$ARTIFACT_PATH
