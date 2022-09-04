#!/bin/bash

cat tls.crt | base64
cat tls.key | base64

# create token locally
kubectl -n kubernetes-dashboard create token admin-user

# get token dashboard
kubectl -n kubernetes-dashboard describe secret $(kubectl -n kubernetes-dashboard get secret | grep admin-user | awk '{print $1}')
kubectl proxy
/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/#/login