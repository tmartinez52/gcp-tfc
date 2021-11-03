provider "google" {
  project     = var.project
  region      = var.region
  zone        = var.zone
}

resource "google_service_account" "builder" {
  account_id = "builder"
  display_name = "builder"
}
