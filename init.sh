#!/bin/bash

kubectl expose deployment deployment-name --type LoadBalancer --port 80 --target-port 8080

#ingress-nginx
https://kubernetes.github.io/ingress-nginx/deploy/#bare-metal
https://xuanthulab.net/trien-khai-nginx-ingress-controller-trong-kubernetes.html






# ingress controller
kubectl apply -f https://raw.githubusercontent.com/dungnv0811/cloud-k8s-infra/master/ingress-nginx/0-nginx-ingress.yaml

# cert-manager
kubectl apply -f https://raw.githubusercontent.com/dungnv0811/cloud-k8s-infra/master/cert-manager/0-cert-manager.yaml

kubectl apply -f https://raw.githubusercontent.com/dungnv0811/cloud-k8s-infra/master/cert-manager-full/1-cert-issuer-nginx-ingress-prod.yaml
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
kubectl apply -f https://raw.githubusercontent.com/dungnv0811/cloud-k8s-infra/master/monitoring/grafana/0-pv.yml
kubectl apply -f https://raw.githubusercontent.com/dungnv0811/cloud-k8s-infra/master/monitoring/grafana/1-service-account.yaml
kubectl apply -f https://raw.githubusercontent.com/dungnv0811/cloud-k8s-infra/master/monitoring/grafana/2-configmap.yaml
kubectl apply -f https://raw.githubusercontent.com/dungnv0811/cloud-k8s-infra/master/monitoring/grafana/3-pvc.yaml
kubectl apply -f https://raw.githubusercontent.com/dungnv0811/cloud-k8s-infra/master/monitoring/grafana/3-secret.yaml
kubectl apply -f https://raw.githubusercontent.com/dungnv0811/cloud-k8s-infra/master/monitoring/grafana/4-deployment.yaml
kubectl apply -f https://raw.githubusercontent.com/dungnv0811/cloud-k8s-infra/master/monitoring/grafana/5-service.yaml
kubectl apply -f https://raw.githubusercontent.com/dungnv0811/cloud-k8s-infra/master/monitoring/grafana/6-ingress.yaml

#elk
kubectl apply -f https://raw.githubusercontent.com/dungnv0811/cloud-k8s-infra/master/elk/0-elasticsearch-single.yaml
kubectl apply -f https://raw.githubusercontent.com/dungnv0811/cloud-k8s-infra/master/elk/1-filebeat-kubernetes.yaml
kubectl apply -f https://raw.githubusercontent.com/dungnv0811/cloud-k8s-infra/master/elk/2-logstash.yaml
kubectl apply -f https://raw.githubusercontent.com/dungnv0811/cloud-k8s-infra/master/elk/3-kibana.yaml
kubectl apply -f https://raw.githubusercontent.com/dungnv0811/cloud-k8s-infra/master/elk/4-ingress.yaml

#argocd
kubectl apply -f https://raw.githubusercontent.com/dungnv0811/cloud-k8s-infra/master/argocd/0-create-namespace.yml
kubectl apply -n argocd -f https://raw.githubusercontent.com/dungnv0811/cloud-k8s-infra/master/argocd/1-deployment.yml
kubectl apply -n argocd -f https://raw.githubusercontent.com/dungnv0811/cloud-k8s-infra/master/argocd/2-ingress.yml










# Deploy PROD
##############################################
kubectl apply -f ingress-nginx
kubectl apply -f https://raw.githubusercontent.com/dungnv0811/cloud-k8s-infra/master/cert-manager/0-cert-manager.yaml
# wait 15s
kubectl apply -f https://raw.githubusercontent.com/dungnv0811/cloud-k8s-infra/master/cert-manager/1-cert-issuer-nginx-ingress-prod.yaml
kubectl apply -f dashboard

kubectl apply -f deployment/uat -n uat
kubectl apply -f deployment/prod -n prod

kubectl apply -f monitoring/prometheus/volume
kubectl apply -f monitoring/prometheus
kubectl apply -f monitoring/node-exporter
kubectl apply -f monitoring/alertmanager
kubectl apply -f monitoring/grafana

add webhook vào slack
####
kubectl apply -f elk

kubectl apply -f argocd/0-create-namespace.yml
kubectl apply -f argocd/1-deployment.yml -n argocd
kubectl apply -f argocd/2-ingress.yml

####
docker run -d --rm --name rancher -p 80:80 -p 443:443 --privileged rancher/rancher:v2.5.2
docker exec -it rancher bash

##############################################
https://prometheus.thuyenthunghoian.com/
https://grafana.thuyenthunghoian.com/login
https://kibana.thuyenthunghoian.com/app/kibana
https://argocd.thuyenthunghoian.com/

#############################################
high memory consume: http_server_requests_seconds_sum{uri=~"/hello.*"}*1000
died server: up{job="uat-application"}


