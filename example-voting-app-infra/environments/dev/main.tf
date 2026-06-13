
module "networking" {
  source = "../../modules/networking"

  project_id = var.project_id
  region     = var.region

  vpc_name    = "voting-app-vpc"
  subnet_name = "voting-app-subnet"
}

module "service_accounts" {
  source = "../../modules/service-accounts"

  project_id = var.project_id
}

module "artifact_registry" {
  source = "../../modules/artifact-registry"

  project_id      = var.project_id
  region          = var.region
  repository_name = "voting-app"
}

module "gke" {
  source = "../../modules/gke"

  project_id = var.project_id
  region     = var.region
  zone       = var.zone

  cluster_name = "voting-app-cluster"

  network    = module.networking.network_name
  subnetwork = module.networking.subnet_name
}

module "node_pools" {
  source = "../../modules/node-pools"

  project_id           = var.project_id
  zone                 = var.zone
  cluster_name         = module.gke.cluster_name
  node_service_account = module.service_accounts.gke_node_sa_email
}

module "vault_workload_identity" {

  source = "../../modules/workload-identity"

  project_id = var.project_id

  namespace = "vault"
  ksa_name  = "vault"

  gsa_email = module.service_accounts.vault_email
}
