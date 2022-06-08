
//Outputs
output "wp_service_url" {
  value = kubernetes_service.wpService.status.0.load_balancer.0.ingress.0.ip

  depends_on = [
    kubernetes_service.wpService
  ]
}

output "db_host" {
  value = google_sql_database_instance.sqldb_Instance.ip_address.0.ip_address

  depends_on = [
    google_sql_database_instance.sqldb_Instance
  ]
}

output "database_name" {
  value = data.google_secret_manager_secret_version.database.secret_data
sensitive = true
  depends_on = [
    google_sql_database_instance.sqldb_Instance
  ]
}

output "db_user_name" {
  value = data.google_secret_manager_secret_version.db_user.secret_data
sensitive = true
  depends_on = [
    google_sql_database_instance.sqldb_Instance
  ]
}

output "db_user_passwd" {
  value = data.google_secret_manager_secret_version.db_user_pass.secret_data
sensitive = true
  depends_on = [
    google_sql_database_instance.sqldb_Instance
  ]
}
