#!/bin/bash

kubectl apply -f monitoring/prometheus/volume
kubectl apply -f monitoring/prometheus
kubectl apply -f monitoring/node-exporter
kubectl apply -f monitoring/alertmanager

https://grafana.com/blog/2020/02/25/step-by-step-guide-to-setting-up-prometheus-alertmanager-with-slack-pagerduty-and-gmail/