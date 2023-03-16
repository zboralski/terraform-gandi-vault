terraform {
  required_providers {
    gandi = {
      source  = "go-gandi/gandi"
      version = ">= 2.1.0"
    }
    vault = {
      source  = "hashicorp/vault"
      version = ">= 3.14.0"
    }
  }
  required_version = ">= 1.0.0"
}
