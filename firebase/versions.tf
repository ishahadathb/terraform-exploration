terraform {
  required_providers {
    tfe = {
        source  = "hashicorp/tfe"
        version = ">= 0.25.0"
    }

    google-beta = {
        source  = "hashicorp/google-beta"
        version = "~> 4.0"
    }
  }
}