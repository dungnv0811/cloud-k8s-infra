#!/bin/bash

kubectl delete -f alertmanager
kubectl delete -f node-exporter
kubectl delete -f prometheus
kubectl delete -f prometheus/volume
