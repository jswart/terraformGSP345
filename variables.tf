variable "region" {
  type   = string
  default = "europe-west4"
}

variable "zone" {
  type = string
  default = "europe-west4-c"
}

variable "project_id" {
  type       = string
  default = "qwiklabs-gcp-01-44c841680bfe"
}

variable "network_name" {
  type       = string
  default = "tf-vpc-005048"
}

variable "firewall_name" {
  type       = string
  default = "tf-firewall"
}