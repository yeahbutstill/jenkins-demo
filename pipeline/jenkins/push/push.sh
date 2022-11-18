#!/bin/bash

echo "********************"
echo "** Pushing image ***"
echo "********************"

IMAGE="mayhome-project"

echo "** Logging in ***"
docker login -u 2819930922 -p $PASS
echo "*** Tagging image ***"
docker tag $IMAGE:$BUILD_TAG 2819930922/$IMAGE:$BUILD_TAG
echo "*** Pushing image ***"
docker push 2819930922/$IMAGE:$BUILD_TAG
