#!/bin/bash

kubectl apply -f monitoring/prometheus/volume
kubectl apply -f monitoring/prometheus
kubectl apply -f monitoring/node-exporter
kubectl apply -f monitoring/alertmanager
kubectl apply -f monitoring/grafana

https://grafana.com/blog/2020/02/25/step-by-step-guide-to-setting-up-prometheus-alertmanager-with-slack-pagerduty-and-gmail/
https://api.slack.com/apps/A044BP8SH39/incoming-webhooks?success=1

# hit + button -> import dashboard
# configuration -> create datasource(choose access browser)