#==================================[ Create Random Password For Argo-CD ]
resource "random_password" "argocd_password" {
  length           = 16
  special          = true
  override_special = "_%@"
}

#==================================[ Deploy Argo-CD By Helm ]
resource "helm_release" "argocd-apps" {
  name             = "argocd"
  namespace        = "argocd"
  create_namespace = true
  chart            = "${path.module}/charts/argo-cd-5.46.8.tgz"
  version          = "5.46.8"
  values = [
    file("${path.module}/values/def-values-argocd.yaml")
  ]

  set {
    name  = "configs.secret.argocdServerAdminPassword"
    value = random_password.argocd_password.result
  }

}
