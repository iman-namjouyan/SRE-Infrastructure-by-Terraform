resource "helm_release" "nginx" {
  name             = "nginx-ingress"
  namespace        = "ingress"
  create_namespace = "true"
  chart            = "${path.module}/charts/nginx-ingress-controller-9.9.2.tgz"
  version          = "9.9.02"
  wait_for_jobs    = false
  wait             = false
  values = [
    file("${path.module}/values/def-values-ingress.yaml")
           ]
}
