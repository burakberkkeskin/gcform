output "vpcId" {
  value = google_compute_network.network.id
}

output "vpcName" {
  value = google_compute_network.network.name
}

output "subnetNames" {
  value = [for s in google_compute_subnetwork.subnet : s.name]
}