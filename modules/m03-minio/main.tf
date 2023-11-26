#==========================================[ Create minIO Namespace ]
resource"kubernetes_namespace" "minio" {
  metadata {
    name = "minio"
           }
                                       }
#==========================================[ Create minIO Random Admin Password ]
resource "random_password" "minio" {
  length           = 12
  special          = true
  override_special = "_%@"
                                   }
#==========================================[ Deploy MinIO By Helm ]
# This resource will destroy (potentially immediately) after null_resource.next
resource "null_resource" "previous" {}

resource "time_sleep" "wait_200_seconds" {
  depends_on = [null_resource.previous]

  create_duration = "200s"
}

# This resource will create (at least) 200 seconds after null_resource.previous
resource "null_resource" "next" {
  depends_on = [time_sleep.wait_200_seconds]
}

resource "helm_release" "minio" {
  name             = "minio"
  namespace        = kubernetes_namespace.minio.metadata.0.name
  create_namespace = "false"
  chart            = "${path.module}/charts/minio-12.9.4.tgz"
  version          = "12.9.4"
  values = [
    file("${path.module}/values/def-values-minio.yaml")
           ]
  
  set {
    name  = "auth.rootPassword"
    value = "${random_password.minio.result}"
      }
                                }
