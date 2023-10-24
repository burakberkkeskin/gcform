resource "google_compute_network" "network" {
  name = var.vpcName
  auto_create_subnetworks = var.autoCreateSubnets
}

resource "google_compute_subnetwork" "subnet" {
  count         = length(var.subnets)
  name          = "subnet-${count.index}"
  ip_cidr_range = var.subnets[count.index].cidr
  region        = var.subnets[count.index].region
  network       = google_compute_network.network.id
}

resource "google_compute_firewall" "firewall" {
  count = length(var.firewalls)
  name    = var.firewalls[count.index].name
  network = google_compute_network.network.name

  allow {
    ports    = var.firewalls[count.index].ports
    protocol = var.firewalls[count.index].protocol
  }

  target_tags   = var.firewalls[count.index].tags
  source_ranges = var.firewalls[count.index].sourceRanges
}