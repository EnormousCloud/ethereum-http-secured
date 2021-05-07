resource "random_string" "password" {
  length  = 20
  upper   = false
  special = false
}
