#!/usr/bin/env bash

kubectl delete ingress ui-ingress
kubectl delete svc ui
kubectl delete deployment ui
kubectl delete deployment ui-canary

kubectl delete svc message-service
kubectl delete deployment message-service

kubectl delete svc message-service
kubectl delete deployment message-service

kubectl delete svc redis mysql
kubectl delete deployment redis mysql

kubectl delete -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-0.32.0/deploy/static/provider/aws/deploy.yaml