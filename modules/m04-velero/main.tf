resource "helm_release" "velero" {
  name             = "velero"
  namespace        = "velero"
  create_namespace = "true"
  chart            = "${path.module}/charts/velero-5.1.3.tgz"
  version          = "5.1.3"
  values = [
    templatefile("${path.module}/values.tftpl", {
			aws_access_key_id = "${var.aws_access_key_id}",
			aws_secret_access_key = "${var.aws_secret_access_key}"
		}),
		"${file("${path.module}/values/def-values-velero.yaml")}"
  ]
}
