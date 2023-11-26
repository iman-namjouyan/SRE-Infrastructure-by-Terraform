output "argocd_password" {
  value = random_password.argocd_password.result
}
