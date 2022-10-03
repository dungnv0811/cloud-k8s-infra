#!/bin/bash
# when removing ns, remove persistentvolume

# decode secret: kubectl get secrets/grafana -n monitoring --template={{.data.admin-user}} | base64 -d
# decode secret: kubectl get secrets/grafana -n monitoring --template={{.data.admin-password}} | base64 -d
# decode: echo YWRtaW4= | base64 --decode
=> admin
# decode: echo cGFzc3dvcmQxMjM= | base64 --decode
=> password123