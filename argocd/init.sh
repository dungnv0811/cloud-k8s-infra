#!/bin/bash

# get secret: admin
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo

# repositories tab -> connect repo using https(no password)(https://github.com/dungnv0811/cloud-k8s-infra)
# go to application tab -> create application
# path: deployment/prod
# destination: url(default...) + namespace(prod)