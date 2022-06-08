




resource "helm_release" "bac" {
  chart      = "wordpress"
  name       = "wordpress"
  repository = "https://charts.bitnami.com/bitnami"
  namespace  = var.namespace
  wait = true
  

  values = [
    templatefile("templates/bac-values.yaml", {
     
    })
  ]
}