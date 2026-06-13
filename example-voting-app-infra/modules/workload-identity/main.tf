resource "google_service_account_iam_member" "workload_identity" {

  service_account_id = "projects/${var.project_id}/serviceAccounts/${var.gsa_email}"

  role = "roles/iam.workloadIdentityUser"

  member = "serviceAccount:${var.project_id}.svc.id.goog[${var.namespace}/${var.ksa_name}]"
}
