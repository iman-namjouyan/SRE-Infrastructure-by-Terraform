resource "helm_release" "metallb" {
  name             = "mettallb"
  namespace        = "metallb-system"
  create_namespace = "true"
  chart            = "${path.module}/charts/metallb-4.16.1.tgz"
  version          = "4.16.1"
}

#==========================[Set StrictArp to Enabled]
resource "kubernetes_config_map_v1_data" "kube-proxy" {
  metadata {
    name = "kube-proxy"
    namespace = "kube-system"
  }
  data = {
    "strictARP" = "true"
  }
}
