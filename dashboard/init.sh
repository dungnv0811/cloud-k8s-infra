#!/bin/bash

cat tls.crt | base64
cat tls.key | base64

# create token locally
kubectl -n kubernetes-dashboard create token admin-user