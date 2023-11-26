#=====================================[ Deploy Hashicorp Consul ]
resource "helm_release" "consul" {
  name             = "consul"
  namespace        = "vault"
  create_namespace = true
  chart            = "${path.module}/charts/consul-1.2.2.tgz"
  version          = "1.2.2"
  timeout          = 60
  wait_for_jobs    = false
  wait             = false
  values = [
    file("${path.module}/values/def-values-consul.yaml")
           ]
                                  }
#=====================================[ Deploy Hashicorp Vault ]
resource "helm_release" "vault" {
  depends_on = [
    helm_release.consul
  ]
  name             = "vault"
  namespace        = "vault"
  create_namespace = true
  chart            = "${path.module}/charts/vault-0.25.0.tgz"
  version          = "0.25.0"
  timeout          = 120
  values = [
    file("${path.module}/values/def-values-vault.yaml")
           ]
                                }
