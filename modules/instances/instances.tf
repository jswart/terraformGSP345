data "google_compute_image" "my_image" {
  name  = "debian-11-bullseye-v20240415"
  project = "debian-cloud"
}

resource "google_compute_instance" "tf-instance-1" {
  name               = "tf-instance-1"
  machine_type       = "e2-micro"
  boot_disk {
    initialize_params {
      image = data.google_compute_image.my_image.self_link
    }
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral public IP
    }
  }
  
  metadata_startup_script = <<-EOT
        #!/bin/bash
    EOT
  allow_stopping_for_update = true

}

resource "google_compute_instance" "tf-instance-2" {
  name               = "tf-instance-2"
  machine_type       = "e2-micro"
  boot_disk {
    initialize_params {
      image = data.google_compute_image.my_image.self_link
    }
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral public IP
    }
  }
  
  metadata_startup_script = <<-EOT
        #!/bin/bash
    EOT
  allow_stopping_for_update = true

}
