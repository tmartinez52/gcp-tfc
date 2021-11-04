provider "google" {
  project     = var.project
  region      = var.region
  zone        = var.zone
}

resource "google_service_account" "github_builder" {
  account_id = "github-builder"
  display_name = "github-builder"
}

data "google_iam_policy" "github_builder" {
  binding {
   role = "roles/cloudbuild.serviceAgent"
   members = [
      "serviceAccount:github-builder@gcp30052.iam.gserviceaccount.com" 
     ]
  }
  #binding {
  #role = "roles/cloudbuild.serviceAccountUser"
  #members = [
  #    "serviceAccount:github-builder@gcp30052.iam.gserviceaccount.com" 
  #   ]
  #}
}
resource "google_service_account_iam_policy" "github_builder_iam" {
  service_account_id = google_service_account.github_builder.name
  policy_data        = data.google_iam_policy.github_builder.policy_data
}
