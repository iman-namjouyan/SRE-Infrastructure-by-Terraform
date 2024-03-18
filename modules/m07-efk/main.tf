#==========================================[ Create kube-logging Namespace ]
resource "kubernetes_namespace" "kube-logging" {
  metadata {
    name = "kube-logging"
  }
}

#==========================================[ Create minIO Random Admin Password ]
resource "random_password" "elasticsearch" {
  length           = 12
  special          = true
  override_special = "_%@"
                                   }
#==========================================[ Create elasticsearch Random Admin Password ]								   
resource "kubernetes_secret" "elastic-credentials" {
  metadata {
    name      = "elastic-credentials"
    namespace = kubernetes_namespace.kube-logging.metadata.0.name
  }
  data = {
    username = "elastic"
    password = "${random_password.elasticsearch.result}"
  }
}

#==========================================[ Deploy elasticsearch By Helm ]
resource "helm_release" "elasticsearch" {
  depends_on = [ 
    kubernetes_secret.elastic-credentials
  ]
  name             = "elasticsearch"
  namespace        = kubernetes_namespace.kube-logging.metadata.0.name
  create_namespace = "false"
  chart            = "${path.module}/charts/elasticsearch-7.17.3.tgz"
  timeout          = 800
  values = [
    file("${path.module}/values/def-values-elasticsearch.yaml")
  ]
}

#==========================================[ Deploy kibana By Helm ]
resource "helm_release" "kibana" {
  depends_on = [
    helm_release.elasticsearch
  ]
  name             = "kibana"
  namespace        = kubernetes_namespace.kube-logging.metadata.0.name
  create_namespace = "false"
  chart            = "${path.module}/charts/kibana-7.17.3.tgz"
  timeout          = 720
  values = [
    file("${path.module}/values/def-values-kibana.yaml"),
  ]
}

#==========================================[ Deploy fluentbit By Helm ]
resource "helm_release" "fluentbit" {
  depends_on = [
    helm_release.elasticsearch,
    helm_release.kibana
  ]
  name             = "fluent-bit"
  namespace        = kubernetes_namespace.kube-logging.metadata.0.name
  create_namespace = "false"
  chart            = "${path.module}/charts/fluent-bit-0.39.1.tgz"
  version          = "0.39.1"
  timeout          = 720
  values = [
    file("${path.module}/values/def-values-fluentbit.yaml"),
  ]
}
#========================================[ Create Kibana Ingress ]
resource "kubernetes_ingress_v1" "kibana" {
  metadata {
    name = "kibana"
    namespace = "kube-logging"
  }
  spec {
    ingress_class_name = "nginx"
    rule {
      host = "kibanauat.local"
      http {
        path {
          path = "/"
          backend {
            service {
              name = "kibana-kibana"
              port {
                number = 5601
              }
            }
          }
        }
      }
    }
  }
}

