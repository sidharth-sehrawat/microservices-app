resource "google_container_node_pool" "system_pool" {

  name     = "system-pool"
  cluster  = var.cluster_name
  location = var.zone

  node_count = 1

  node_config {

    machine_type = "e2-standard-4"

    service_account = var.node_service_account

    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]

    labels = {
      workload = "system"
    }
  
    taint {
      key    = "workload"
      value  = "system"
      effect = "NO_SCHEDULE"
    }
  
  }

  autoscaling {
    min_node_count = 1
    max_node_count = 3
  }

  management {
    auto_repair  = true
    auto_upgrade = true
  }
}


resource "google_container_node_pool" "app_pool" {

  name     = "app-pool"
  cluster  = var.cluster_name
  location = var.zone

  node_count = 1

  node_config {

    machine_type = "e2-standard-2"

    service_account = var.node_service_account

    spot = true

    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]

    labels = {
      workload = "application"
    }
  }

  autoscaling {
    min_node_count = 1
    max_node_count = 5
  }

  management {
    auto_repair  = true
    auto_upgrade = true
  }
}
