output "longhorn_password" {
  value = random_password.basic_auth_password.result
}
