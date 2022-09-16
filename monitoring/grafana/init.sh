#!/bin/bash
# when removing ns, remove persistentvolume

# decode secret: kubectl get secrets/grafana -n monitoring --template={{.data.admin-user}} | base64 -d
# decode secret: kubectl get secrets/grafana -n monitoring --template={{.data.admin-password}} | base64 -d
# decode: echo YWRtaW4= | base64 --decode