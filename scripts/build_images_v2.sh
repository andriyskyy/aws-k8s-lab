#!/usr/bin/env bash

cd ../
bash gradlew bootJar docker dockerPush :ui:dockerPushV2 :message:dockerPushV2