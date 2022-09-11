#!/bin/bash

kubectl expose deployment deployment-name --type LoadBalancer --port 80 --target-port 8080

#ingress-nginx
https://kubernetes.github.io/ingress-nginx/deploy/#bare-metal
https://xuanthulab.net/trien-khai-nginx-ingress-controller-trong-kubernetes.html