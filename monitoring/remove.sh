#!/bin/bash

kubectl delete -f monitoring/grafana
kubectl delete -f monitoring/alertmanager
kubectl delete -f monitoring/node-exporter
kubectl delete -f monitoring/prometheus
kubectl delete -f monitoring/prometheus/volume
