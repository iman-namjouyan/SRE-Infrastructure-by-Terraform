#==========================================[ Create Monitoring Namespace ]
resource "kubernetes_namespace" "monitoring" {
  metadata {
    name = "monitoring"
  }
}
#==========================================[ Create Grafna Random Password ]
resource "random_password" "grafana_admin_dashboard_password" {
  length           = 12
  special          = true
  override_special = "_%@"
}
#==========================================[ Create External ETCD Secret For Monitoring By Prometheus ]
resource "kubernetes_secret_v1" "etcd-client-cert" {
  metadata {
    name = "etcd-client-cert"
    namespace = "monitoring"
  }

  data = {
    "ca.pem" = file("/etc/ssl/etcd/ssl/ca.pem")
    "etcd-cert.pem" = file("/etc/ssl/etcd/ssl/member-master1.pem")
    "etcd-key.pem" = file("/etc/ssl/etcd/ssl/member-master1-key.pem")
  }
}
#==========================================[ Deploy Prometheus-Stack By Helm ]
resource "helm_release" "prometheus-stack" {
  name             = "monitoring"
  namespace        = "monitoring"
  create_namespace = "false"
  chart            = "${path.module}/charts/kube-prometheus-stack-51.3.0.tgz"
  version          = "51.3.0"
  timeout          = 720
  values = [
    file("${path.module}/values/def-values-prometheus.yaml")
           ]
  set {
    name  = "grafana.adminPassword"
    value = random_password.grafana_admin_dashboard_password.result
  }
}
