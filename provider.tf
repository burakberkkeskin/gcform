provider "google" {
  project     = "safworkshop"
  region      = "europe-west3"
  credentials = file("~/.config/gcloud/safworkshop-terraform.json")
}