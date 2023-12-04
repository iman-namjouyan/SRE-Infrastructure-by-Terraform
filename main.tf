# This Config Deploying and Configuring : HELM, MinIO, Longhorn Block Storage,
# Prometheus Stack,ArgoCD, Gitlab, EFK Stack, Velero, Hashicorp-Vault Backup Tools
# Created by: Iman Namjooyan
# E.Mail: im.namjuyan@gmail.com
# Date: 2023-11-14

terraform {
  required_version = ">= 1.0.4"
required_providers {  
    kubernetes = {
      source = "hashicorp/kubernetes"
    }
    helm =  {
        source = "hashicorp/helm"
    }
 htpasswd = {
      source = "loafoe/htpasswd"
      version = "1.0.1"
    }
 }
}
#======================[Define Providers]
provider "kubernetes" {
  config_path = "/root/.kube/config"
    }

provider "helm" {
  kubernetes {
    config_path = "/root/.kube/config"
 }

}

#======================[Define Modules]
module "m00-nginx-ingress" {
     source = "./modules/m00-nginx-ingress"
}

module "m01-longhorn" {
     source = "./modules/m01-longhorn"
}

module "m02-prometheus-stack" {
     depends_on = [module.m01-longhorn]
     source = "./modules/m02-prometheus-stack"
}

module "m03-minio" {
  depends_on = [module.m02-prometheus-stack]
  source = "./modules/m03-minio"
}

module "m04-velero" {
  depends_on = [module.m03-minio]
  source = "./modules/m04-velero"
  aws_access_key_id = "velero-user"
  aws_secret_access_key = "${module.m03-minio.minio_admin_password}"
}

module "m05-argocd" {
  depends_on = [module.m04-velero]
  source = "./modules/m05-argocd"
}

module "m06-hashicorp-vault" {
  depends_on = [module.m05-argocd]
  source = "./modules/m06-hashicorp-vault"
}

module "m07-efk" {
     depends_on = [module.m06-hashicorp-vault]
     source = "./modules/m07-efk"
}

module "m08-gitlab" {
  depends_on = [module.m07-efk]
  source = "./modules/m08-gitlab"
}

#======================[Define Outputs]
output "grafana_admin_dashboard_password" {
  value = module.m02-prometheus-stack.grafana_admin_dashboard_password
  sensitive = true
}

output "argocd_password" {
  value = module.m05-argocd.argocd_password
  sensitive = true
}
