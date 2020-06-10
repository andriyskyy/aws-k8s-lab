#!/usr/bin/env bash

kubectl apply -f mysql-deployment.yaml -f mysql-service.yaml --record
kubectl apply -f redis-deployment.yaml -f redis-service.yaml --record
kubectl apply -f guestbookservice-deployment.yaml -f guestbookservice-service.yaml --record
kubectl apply -f messageservice-deployment-v1.yaml -f messageservice-service.yaml --record
kubectl apply -f ui-deployment-v1.yaml -f ui-service.yaml -f ui-ingress.yaml --record
