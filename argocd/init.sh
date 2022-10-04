#!/bin/bash

# get secret: admin
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo

# repositories tab -> connect repo using https(no password)
# go to application tab -> create application