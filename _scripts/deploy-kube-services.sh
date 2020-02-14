#!/usr/bin/env bash
kubectl create -f deploy-rustic-auth-service.yaml
kubectl create -f deploy-rustic-ui-service.yaml
kubectl create -f deploy-rustic-users-service.yaml
kubectl create -f deploy-rustic-locations-service.yaml
