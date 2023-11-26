terraform {
required_providers {
    htpasswd = {
      source = "loafoe/htpasswd"
      version = "1.0.1"
    }
  }
}
#====================================================[ Create longhorn Namespace ]
resource "kubernetes_namespace_v1" "longhorn-system" {
  metadata {
    name = "longhorn-system"
  }
}
#====================================================[ Deploy longhorn By Helm ]
resource "helm_release" "longhorn" {
  name             = "longhorn"
  namespace        = "longhorn-system"
  create_namespace = "true"
  chart            = "${path.module}/charts/longhorn-1.5.1.tgz"
  version          = "1.5.1"
  timeout          = 800
  values = [
		"${file("${path.module}/values/def-values-longhorn.yml")}"
  ]
}
#====================================================[ Create Ingress For Longhorn Dashboard With Basic Authentication ]
resource "random_password" "basic_auth_password" {
  length           = 16
  special          = true
  override_special = "_@"
}

resource "kubernetes_secret_v1" "longhorn-ui-auth" {
  metadata {
    name      = "basic-auth"
    namespace = "longhorn-system"
  }
  data = {
#    auth = "admin:${htpasswd_password.longhorn-password.bcrypt}"
    "auth" : "admin:${random_password.basic_auth_password.result}"
  }
}

resource "kubernetes_ingress_v1" "longhorn" {
  depends_on = [
    helm_release.longhorn
  ] 
  metadata {
    name = "longhorn"
	namespace = "longhorn-system"
    annotations = {
      "nginx.ingress.kubernetes.io/auth-type"   = "basic"
      "nginx.ingress.kubernetes.io/auth-secret" = "basic-auth"
      "nginx.ingress.kubernetes.io/auth-realm"  = "Authentication Required"
    }
  }

  spec {
    ingress_class_name = "nginx"
    rule {
			host = "longhorn.local"
      http {
        path {
          path = "/"
          backend {
			service {
              name = "longhorn-frontend"
				port {
				  number = 80
				   	 }
					}
                  }
             }
           }
         }
       }
}
