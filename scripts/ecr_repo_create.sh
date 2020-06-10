#!/usr/bin/env bash

for name in "ui" "message" "guestbook"
do
  /usr/local/bin/aws ecr create-repository \
    --repository-name "${REPO_PREFIX}"-"${name}" \
    --image-scanning-configuration scanOnPush=true \
    --region "${REGION}"
done