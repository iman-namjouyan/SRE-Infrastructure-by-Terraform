terraform {
required_providers {
    htpasswd = {
      source = "loafoe/htpasswd"
      version = "1.0.4"
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
  chart            = "${path.module}/charts/longhorn-1.6.0.tgz"
  version          = "1.6.0"
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

resource "random_password" "salt" {
  length = 8
}

resource "htpasswd_password" "hash" {
  password = random_password.basic_auth_password.result
  salt     = substr(sha512(random_password.basic_auth_password.result), 0, 8)
}


resource "kubernetes_secret_v1" "longhorn-ui-auth" {
  metadata {
    name      = "basic-auth"
    namespace = "longhorn-system"
  }
  data = {
    "auth" : "admin:${htpasswd_password.hash.bcrypt}"
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
    host = "longhornuat.local"
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
