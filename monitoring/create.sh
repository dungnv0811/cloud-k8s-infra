#!/bin/bash

kubectl create -f prometheus/volume
kubectl create -f prometheus
kubectl create -f node-exporter
kubectl create -f alertmanager
