variable "gcp_project_id" {
  description = "GCP Project ID of Biplob"
  type        = string
  default     = "gcp-ishahadathb"
}

variable "gcp_region" {
  description = "GCP Region Of the Biplobs project"
  type        = string
  default     = "europe-west6-a"
}

variable "firebase_project_location" {
  description = "Location of firebase project"
  type        = string
  default     = "europe-west6"
}

variable "firebase_reatltime_db_location" {
  description = "The location firebase realtime database"
  type        = string
  default     = "europe-west1"
}

variable "firestore_location" {
  description = "firestore location"
  type        = string
  default     = "eur3"
}

variable "default_network" {
  description = "Default network"
  type        = string
  default     = "default"
}