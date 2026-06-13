output "argocd_email" {
  value = google_service_account.argocd.email
}

output "vault_email" {
  value = google_service_account.vault.email
}

output "vote_email" {
  value = google_service_account.vote.email
}

output "gke_node_sa_email" {
  value = google_service_account.gke_nodes.email
}
