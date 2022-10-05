#!/bin/bash

# https://www.elastic.co/guide/en/cloud-on-k8s/1.5/k8s-deploy-elasticsearch.html

kubectl get pods -n elastic-system
kubectl -n elastic-system logs -f statefulset.apps/elastic-operator

# Monitor Elastic Search
kubectl get pods --selector='elasticsearch.k8s.elastic.co/cluster-name=quickstart'
# Get password with username elastic
PASSWORD=$(kubectl get secret quickstart-es-elastic-user -o go-template='{{.data.elastic | base64decode}}')
curl -u "elastic:$PASSWORD" -k "https://quickstart-es-http:9200"
kubectl port-forward service/quickstart-es-http 9200
curl -u "elastic:$PASSWORD" -k "https://localhost:9200"


# Monitor Kibana health and creation progress.
kubectl get kibana
kubectl get pod --selector='kibana.k8s.elastic.co/name=quickstart'
#Use kubectl port-forward to access Kibana from your local workstation:
kubectl port-forward service/quickstart-kb-http 5601
#Get password with username: elastic
kubectl get secret quickstart-es-elastic-user -o=jsonpath='{.data.elastic}' | base64 --decode; echo
