#!/bin/bash

kubectl expose deployment deployment-name --type LoadBalancer --port 80 --target-port 8080

#ingress-nginx
https://kubernetes.github.io/ingress-nginx/deploy/#bare-metal
https://xuanthulab.net/trien-khai-nginx-ingress-controller-trong-kubernetes.html






# ingress controller
kubectl apply -f https://raw.githubusercontent.com/dungnv0811/cloud-k8s-infra/master/ingress-nginx/0-nginx-ingress.yaml

# dashboard
https://raw.githubusercontent.com/dungnv0811/cloud-k8s-infra/master/dashboard/0-create-namespace.yml
https://raw.githubusercontent.com/dungnv0811/cloud-k8s-infra/master/dashboard/1-secret.yml
https://raw.githubusercontent.com/dungnv0811/cloud-k8s-infra/master/dashboard/2-admin-user.yml
https://raw.githubusercontent.com/dungnv0811/cloud-k8s-infra/master/dashboard/3-dashboard.yml
https://raw.githubusercontent.com/dungnv0811/cloud-k8s-infra/master/dashboard/4-ingress.yaml

#monitoring
https://raw.githubusercontent.com/dungnv0811/cloud-k8s-infra/master/monitoring/prometheus/volume/0-namespace.yaml
https://raw.githubusercontent.com/dungnv0811/cloud-k8s-infra/master/monitoring/prometheus/volume/0-prometheus-data-pv-template.yml
https://raw.githubusercontent.com/dungnv0811/cloud-k8s-infra/master/monitoring/prometheus/volume/1-prometheus-data-pvc-template.yml

#elk
https://raw.githubusercontent.com/dungnv0811/cloud-k8s-infra/master/elk/0-elasticsearch-single.yaml
https://raw.githubusercontent.com/dungnv0811/cloud-k8s-infra/master/elk/1-filebeat-kubernetes.yaml
https://raw.githubusercontent.com/dungnv0811/cloud-k8s-infra/master/elk/2-logstash.yaml
https://raw.githubusercontent.com/dungnv0811/cloud-k8s-infra/master/elk/3-kibana.yaml

https://raw.githubusercontent.com/dungnv0811/cloud-k8s-infra/master/monitoring/prometheus/1-prometheus-config-template.yml
https://raw.githubusercontent.com/dungnv0811/cloud-k8s-infra/master/monitoring/prometheus/2-prometheus-rbac-template.yml
https://raw.githubusercontent.com/dungnv0811/cloud-k8s-infra/master/monitoring/prometheus/3-prometheus-deployment-template.yml

https://raw.githubusercontent.com/dungnv0811/cloud-k8s-infra/master/monitoring/node-exporter/node-exporter-ds-template.yaml

https://raw.githubusercontent.com/dungnv0811/cloud-k8s-infra/master/monitoring/alertmanager/0-alertmanager-config-template.yaml
https://raw.githubusercontent.com/dungnv0811/cloud-k8s-infra/master/monitoring/alertmanager/1-alertmanager-statefulset-template.yaml

# cert-manager
https://raw.githubusercontent.com/dungnv0811/cloud-k8s-infra/master/cert-manager1/0-cert-manager.yaml

https://raw.githubusercontent.com/dungnv0811/cloud-k8s-infra/master/cert-manager1/1-cert-issuer-nginx-ingress-prod.yaml
https://raw.githubusercontent.com/dungnv0811/cloud-k8s-infra/master/cert-manager1/1-cert-issuer-nginx-ingress.yaml
https://raw.githubusercontent.com/dungnv0811/cloud-k8s-infra/master/cert-manager1/2-certificate.yaml