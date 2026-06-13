terraform {
  backend "gcs" {
    bucket  = "voting-app-devsecops-2026-tfstate"
    prefix  = "bootstrap/state"
  }
}
