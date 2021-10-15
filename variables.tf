variable "region" {
  description = "GCP region"
  default     = "us-central1"
}

variable "instance_type" {
  description = "Type of Compute Engine instance to provision"
  default     = "e2-small"
}

variable "instance_name" {
  description = "Compute instance name"
  default     = "Provisioned by Terraform"
}
variable "project_id" {
  description = "Project ID"
  default = "Project_ID"
}
