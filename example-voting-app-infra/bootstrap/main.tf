resource  "google_storage_bucket" "terraform_state" {
  name  = var.bucket_name
  location  = var.region

  uniform_bucket_level_access = true

  versioning  {
    enabled = true
  }

  lifecycle_rule  {
    action  {    
      type  = "Delete"
    }
  
  condition {
    age = 30
    }
  }
}
