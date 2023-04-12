provider "google" {
  project     = var.gcp_project_id
  region      = var.gcp_region
  credentials = file("./provisioner-sa.json")
}

provider "google-beta" {
  project     = var.gcp_project_id
  region      = var.gcp_region
  credentials = file("./provisioner-sa.json")
}