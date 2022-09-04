#!/bin/bash

kubectl apply -f monitoring/prometheus/volume
kubectl apply -f monitoring/prometheus
kubectl apply -f monitoring/node-exporter
kubectl apply -f monitoring/alertmanager
