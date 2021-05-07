terraform {
  required_providers {
    local = {
      source = "hashicorp/local"
    }
    random = {
      source = "hashicorp/random"
    }
    htpasswd = {
      source = "loafoe/htpasswd"
    }
  }
  required_version = ">= 0.15"
}
