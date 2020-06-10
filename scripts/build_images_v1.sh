#!/usr/bin/env bash

cd ../
bash gradlew bootJar docker dockerPush :ui:dockerPushV1 :message:dockerPushV1