provider "google" {
  project     = var.project
  region      = var.region
  zone        = var.zone
}

resource "google_service_account" "github_build" {
  account_id = "github-build"
  display_name = "github-build"
}

data "google_iam_policy" "github_builder" {
  binding {
   role = "roles/cloudbuild.serviceAgent"
   members = [
      "serviceAccount:github-builder@gcp30052.iam.gserviceaccount.com" 
     ]
  }
  binding {
   role = "roles/cloudbuild.serviceAccountUser"
   members = [
      "serviceAccount:github-builder@gcp30052.iam.gserviceaccount.com" 
     ]
  }
}
