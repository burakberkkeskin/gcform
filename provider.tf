terraform {
  required_providers {
    google = {
      version = "~> 5.0.0"
    }
  }
}

provider "google" {
  project     = "safworkshop"
  region      = "europe-west3"
  credentials = file("~/.config/gcloud/safworkshop-terraform.json")
}
