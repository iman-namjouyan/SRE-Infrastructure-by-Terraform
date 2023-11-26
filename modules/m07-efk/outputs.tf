output "elasticsearch_admin_password" {
	value = "${random_password.elasticsearch.result}"
	sensitive = true
}