#!/usr/bin/env bash

for name in "ui" "message" "guestbook"
do
  /usr/local/bin/aws ecr delete-repository \
      --repository-name "${REPO_PREFIX}"-"${name}" \
      --force
done