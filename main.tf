provider "google" {
  project     = var.project
  region      = var.region
  zone        = var.zone
}

resource "google_service_account" "github_builder" {
  account_id = "github-builder"
  display_name = "github-builder"
}
