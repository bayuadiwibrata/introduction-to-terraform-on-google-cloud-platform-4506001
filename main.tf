data "google_compute_image" "ubuntu" {
  most_recent = true
  project     = "ubuntu-os-cloud" 
  family      = "ubuntu-2204-lts"
}

resource "google_compute_instance" "web" {
  name         = "compute-terraform-web"
  machine_type = "n1-standard-1"

  
  boot_disk {
    initialize_params {
      image = data.google_compute_image.ubuntu.self_link
    }
  }
  network_interface {
   subnetwork = "devops-dev-salma-subnet-01"
   access_config {
      # Leave empty for dynamic public IP
    }
  }  

}
