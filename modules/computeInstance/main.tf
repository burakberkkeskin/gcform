resource "google_compute_instance" "default" {
  name         = var.computeInstanceName
  machine_type = var.computeInstanceType
  zone         = var.zone

  tags = var.tags

  boot_disk {
    initialize_params {
      image = var.bootDisk.image
      size = var.bootDisk.size
      labels = var.bootDisk.labels
    }
  }

  network_interface {
    network = var.networkInterface.network
    subnetwork = var.networkInterface.subnet
    access_config {
      nat_ip = var.natIp != "" ? var.natIp : null
    }
  }

  metadata = var.metadata

  metadata_startup_script = <<SCRIPT
echo test1 > /terraformStartup.txt
echo test2 > /terraformStartup.txt
    SCRIPT

}