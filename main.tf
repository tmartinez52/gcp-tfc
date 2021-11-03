provider "google" {
  project     = var.project
  region      = var.region
  zone        = var.zone
}

resource "google_service_account" "service_acccount" {
  account_id = "service-account-id"
  display_name = "Service Account"
}
