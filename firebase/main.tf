resource "google_project_service" "service_usage" {
  project = var.gcp_project_id
  service = "cloudresourcemanager.googleapis.com"
}

resource "google_project_service" "enable_firebase" {
  project = var.gcp_project_id
  service = "firebase.googleapis.com"
  disable_dependent_services = true
}

resource "google_project_service" "enable_firebase_rtdb" {
  project = var.gcp_project_id
  service = "firebasedatabase.googleapis.com"
}

resource "google_project_service" "enable_firestore" {
  project = var.gcp_project_id
  service = "firestore.googleapis.com"
}

resource "google_firebase_project" "firebase_service" {
  provider = google-beta
  project = var.gcp_project_id
 
  depends_on = [
    google_project_service.enable_firebase,
    google_project_service.service_usage,
  ]
}

resource "google_firebase_project_location" "firebase_location" {
    provider = google-beta
    project = var.gcp_project_id

    location_id = var.firebase_project_location
}

resource "google_firebase_web_app" "firebase_web_app" {
  provider = google-beta
  project = var.gcp_project_id
  display_name = "Firebase webb app"

  depends_on = [
    google_firebase_project.firebase_service
  ]
}



resource "google_firebase_database_instance" "firebase_reatltime_db" {
  provider = google-beta
  region = var.firebase_reatltime_db_location
  instance_id = "hom-biplob-terraform-default-rtdb"
  type = "DEFAULT_DATABASE"

  depends_on = [
    google_firebase_project.firebase_service,
    google_project_service.enable_firebase_rtdb,
    google_firebase_web_app.firebase_web_app
  ]
}

resource "google_firestore_database" "firestore" {
  provider = google-beta
  location_id = var.firebase_project_location
  name = "firestore-db"
  type = "FIRESTORE_NATIVE"

  depends_on = [
    google_project_service.enable_firestore
  ]
}

