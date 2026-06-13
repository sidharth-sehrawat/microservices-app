resource  "google_service_account"  "argocd"  {
  account_id  = "argocd-sa"
  display_name  = "ArgoCD Service Account"
}

resource  "google_service_account"  "vault" {
  account_id  = "vault-sa"
  display_name  = "Vault Service Account"
}

resource  "google_service_account"  "vote"  {
  account_id = "vote-sa"
  display_name  = "Vote Service Account"
}

resource "google_service_account" "gke_nodes" {
  account_id   = "gke-node-sa"
  display_name = "GKE Node Service Account"
}
