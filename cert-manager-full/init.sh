#!/bin/bash

#deploy one by one
1. deploy ingress controller
2. add LB IP to dns
  for local loadbalancer:
    kubectl -n ingress-nginx --address 0.0.0.0 port-forward svc/ingress-nginx-controller 80
    kubectl -n ingress-nginx --address 0.0.0.0 port-forward svc/ingress-nginx-controller 443
1. create cert manager
2. create cert issuer
  kubectl describe clusterissuer letsencrypt-cluster-issuer
  => status => ready
3. create certificate
  kubectl describe certificate letsencrypt-secret-dvnguyen -n ingress-nginx
4. using it in ingress


https://www.youtube.com/watch?v=hoLUigg4V18