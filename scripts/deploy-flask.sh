#!/bin/bash
TAG=$1
echo "start tiller"
export KUBECONFIG=$HOME/.kube/kubeconfig
helm tiller start-ci
export HELM_HOST=127.0.0.1:44134
result=$(eval helm ls | grep flask-helm-chart) 
if [ $? -ne "0" ]; then 
   helm install --timeout 180 --name flask-helm-chart --set image.tag=$TAG charts/flask-helm-chart
else 
   helm upgrade --timeout 180 flask-helm-chart --set image.tag=$TAG charts/flask-helm-chart
fi
echo "stop tiller"
helm tiller stop 