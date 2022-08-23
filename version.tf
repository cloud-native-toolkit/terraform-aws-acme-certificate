terraform {
  required_version = ">= 0.15.0"
  required_providers {
    acme = {
      source  = "vancluever/acme"
      version = "2.8.0"
    }
  }
}