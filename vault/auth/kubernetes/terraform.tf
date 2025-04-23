terraform {
  required_providers {
    vault = {
      source = "hashicorp/vault"
      version = "4.7.0"
    }
  }
}

provider "vault" {
  # Configuration options
}
