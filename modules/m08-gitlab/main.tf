resource "helm_release" "gitlab" {
  name             = "gitlab"
  namespace        = "gitlab"
  create_namespace = true
  chart            = "${path.module}/charts/gitlab-7.4.1.tgz"
  version          = "7.4.1"
  timeout          = 7800
  values = [
    file("${path.module}/values/def-values-gitlab.yaml")
           ]
                                  }
