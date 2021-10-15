provider "google" {
  project     = var.project
  region      = var.region
  zone        = var.zone
}

resource "google_compute_network" "vpc_network" {
  name = "terraform-network"
}

resource "google_compute_instance" "vm_instance" {
    name = "terraform-instance"
    machine_type = "f1-micro"

    boot_disk {
      initialize_params{
        image = "cos-cloud/cos-stable"
      }
    }

    network_interface {
      network = google_compute_network.vpc_network.name
      access_config{
      }
    }
}
resource "google_compute_instance" "vm_instance_two" {
    name = "terraform-instance-two"
    machine_type = "f1-micro"


    boot_disk {
      initialize_params{
        image = "debian-cloud/debian-9"
      }
    }

    network_interface {
      network = google_compute_network.vpc_network.name
      access_config{
      }
    }
}

resource "google_sql_database" "database" {
  name     = "my-database"
  instance = google_sql_database_instance.instance.name
}

resource "google_sql_database_instance" "sql_db" {
  name   = "my-db-instance"
  region = var.region
  settings {
    tier = "db-f1-micro"
  }

  deletion_protection  = "true"
}
