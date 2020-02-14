#!/usr/bin/env bash
kubectl create -f deploy-rustic-ui-ingress.yaml
kubectl create -f deploy-rustic-services-ingress.yaml
