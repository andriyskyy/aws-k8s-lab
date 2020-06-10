#!/usr/bin/env bash

kubectl delete ingressvui-ingress
kubectl delete svc ui
kubectl delete deployment ui