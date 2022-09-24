#!/bin/bash

kubectl expose deployment deployment-name --type LoadBalancer --port 80 --target-port 8080

#ingress-nginx
https://kubernetes.github.io/ingress-nginx/deploy/#bare-metal
https://xuanthulab.net/trien-khai-nginx-ingress-controller-trong-kubernetes.html






# ingress controller
kubectl apply -f https://raw.githubusercontent.com/dungnv0811/cloud-k8s-infra/master/ingress-nginx/0-nginx-ingress.yaml

# cert-manager
kubectl apply -f https://raw.githubusercontent.com/dungnv0811/cloud-k8s-infra/master/cert-manager/0-cert-manager.yaml
kubectl apply -f https://raw.githubusercontent.com/dungnv0811/cloud-k8s-infra/master/cert-manager/1-cert-issuer-nginx-ingress-prod.yaml
#or
kubectl apply -f https://raw.githubusercontent.com/dungnv0811/cloud-k8s-infra/master/cert-manager/1-cert-issuer-nginx-ingress.yaml


# dashboard
kubectl apply -f https://raw.githubusercontent.com/dungnv0811/cloud-k8s-infra/master/dashboard/0-create-namespace.yml
kubectl apply -f https://raw.githubusercontent.com/dungnv0811/cloud-k8s-infra/master/dashboard/1-secret.yml
kubectl apply -f https://raw.githubusercontent.com/dungnv0811/cloud-k8s-infra/master/dashboard/2-admin-user.yml
kubectl apply -f https://raw.githubusercontent.com/dungnv0811/cloud-k8s-infra/master/dashboard/3-dashboard.yml
kubectl apply -f https://raw.githubusercontent.com/dungnv0811/cloud-k8s-infra/master/dashboard/4-ingress.yaml

#monitoring
kubectl apply -f https://raw.githubusercontent.com/dungnv0811/cloud-k8s-infra/master/monitoring/prometheus/volume/0-namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/dungnv0811/cloud-k8s-infra/master/monitoring/prometheus/volume/0-prometheus-data-pv-template.yml
kubectl apply -f https://raw.githubusercontent.com/dungnv0811/cloud-k8s-infra/master/monitoring/prometheus/volume/1-prometheus-data-pvc-template.yml

kubectl apply -f https://raw.githubusercontent.com/dungnv0811/cloud-k8s-infra/master/monitoring/prometheus/1-prometheus-config-template.yml
kubectl apply -f https://raw.githubusercontent.com/dungnv0811/cloud-k8s-infra/master/monitoring/prometheus/2-prometheus-rbac-template.yml
kubectl apply -f https://raw.githubusercontent.com/dungnv0811/cloud-k8s-infra/master/monitoring/prometheus/3-prometheus-deployment-template.yml
kubectl apply -f https://raw.githubusercontent.com/dungnv0811/cloud-k8s-infra/master/monitoring/prometheus/4-ingress.yml

kubectl apply -f https://raw.githubusercontent.com/dungnv0811/cloud-k8s-infra/master/monitoring/node-exporter/node-exporter-ds-template.yaml

kubectl apply -f https://raw.githubusercontent.com/dungnv0811/cloud-k8s-infra/master/monitoring/alertmanager/0-alertmanager-config-template.yaml
kubectl apply -f https://raw.githubusercontent.com/dungnv0811/cloud-k8s-infra/master/monitoring/alertmanager/1-alertmanager-statefulset-template.yaml
kubectl apply -f https://raw.githubusercontent.com/dungnv0811/cloud-k8s-infra/master/monitoring/alertmanager/2-ingress.yml
#grafana

#elk
kubectl apply -f https://raw.githubusercontent.com/dungnv0811/cloud-k8s-infra/master/elk/0-elasticsearch-single.yaml
kubectl apply -f https://raw.githubusercontent.com/dungnv0811/cloud-k8s-infra/master/elk/1-filebeat-kubernetes.yaml
kubectl apply -f https://raw.githubusercontent.com/dungnv0811/cloud-k8s-infra/master/elk/2-logstash.yaml
kubectl apply -f https://raw.githubusercontent.com/dungnv0811/cloud-k8s-infra/master/elk/3-kibana.yaml
kubectl apply -f https://raw.githubusercontent.com/dungnv0811/cloud-k8s-infra/master/elk/4-ingress.yml

#argocd
kubectl apply -f https://raw.githubusercontent.com/dungnv0811/cloud-k8s-infra/master/argocd/0-create-namespace.yml
kubectl apply -n argocd -f https://raw.githubusercontent.com/dungnv0811/cloud-k8s-infra/master/argocd/1-deployment.yml
kubectl apply -n argocd -f https://raw.githubusercontent.com/dungnv0811/cloud-k8s-infra/master/argocd/2-ingress.yml