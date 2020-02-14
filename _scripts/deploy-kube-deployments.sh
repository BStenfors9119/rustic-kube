#!/usr/bin/env bash
kubectl create -f deploy-rustic-auth.yaml
kubectl create -f deploy-rustic-ui.yaml
kubectl create -f deploy-rustic-users.yaml
kubectl create -f deploy-rustic-locations.yaml
