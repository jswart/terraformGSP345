terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "5.25.0"
    }
  }
  backend "gcs" {
    bucket  = "tf-bucket-679288"
    prefix  = "terraform/state"
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
  zone    = var.zone
}

module "instances" {
  source = "./modules/instances"
}

module "storage" {
  source = "./modules/storage"
}

module "vpc" {
    source  = "terraform-google-modules/network/google"
    version = "7.5.0"

    project_id   = var.project_id
    network_name = "tf-vpc-005048"
    routing_mode = "GLOBAL"

    subnets = [
        {
            subnet_name           = "subnet-01"
            subnet_ip             = "10.10.10.0/24"
            subnet_region         = "europe-west4"
        },
        {
            subnet_name           = "subnet-02"
            subnet_ip             = "10.10.20.0/24"
            subnet_region         = "europe-west4"
        }
    ]
}