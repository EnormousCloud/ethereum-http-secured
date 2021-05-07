resource "htpasswd_password" "hash" {
  password = local.password
}