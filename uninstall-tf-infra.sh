#!/bin/bash
echo "=========Uninstalling Vault and Consul=========="
helm uninstall -n vault vault consul
kubectl delete ns vault --grace-period 0 --force
sleep 2
echo "=========Uninstalling Prometheus Stack=========="
helm uninstall -n monitoring monitoring 
kubectl delete crd alertmanagerconfigs.monitoring.coreos.com
kubectl delete crd alertmanagers.monitoring.coreos.com
kubectl delete crd podmonitors.monitoring.coreos.com
kubectl delete crd probes.monitoring.coreos.com
kubectl delete crd prometheusagents.monitoring.coreos.com
kubectl delete crd prometheuses.monitoring.coreos.com
kubectl delete crd prometheusrules.monitoring.coreos.com
kubectl delete crd scrapeconfigs.monitoring.coreos.com
kubectl delete crd servicemonitors.monitoring.coreos.com
kubectl delete crd thanosrulers.monitoring.coreos.com
kubectl delete ns monitoring --grace-period 0 --force
sleep 2
echo "=========Uninstalling EFK Stack=========="
helm uninstall -n kube-logging fluent-bit 
helm uninstall -n kibana
helm uninstall -n elasticsearch
kubectl delete ns  kube-logging --grace-period 0 --force
sleep 2
echo "=========Uninstalling Gitlab=========="
helm uninstall -n gitlab gitlab
kubectl delete ns  gitlab --grace-period 0 --force
sleep 2
echo "=========Uninstalling ArgoCD=========="
helm uninstall -n argocd argocd
kubectl delete ns  argocd  --grace-period 0 --force
sleep 2
echo "=========Uninstalling Velero=========="
helm uninstall -n velero velero
kubectl delete ns  velero --grace-period 0 --force
sleep 2
echo "=========Uninstalling MinIO=========="
helm uninstall -n minio minio
kubectl delete ns  minio --grace-period 0 --force
sleep 2
echo "=========Uninstalling Longhorn=========="
kubectl -n longhorn-system patch -p '{"value": "true"}' --type=merge lhs deleting-confirmation-flag
sleep 3
helm uninstall longhorn -n longhorn-system
sleep 5
kubectl delete ns longhorn-system
sleep 3
kubectl delete sc longhorn

echo "=========Uninstalling Nginx Ingress=========="
helm uninstall longhorn -n ingress nginx-ingress
kubectl delete ns ingress
