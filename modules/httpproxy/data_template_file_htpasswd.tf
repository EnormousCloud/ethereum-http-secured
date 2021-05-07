data "template_file" "htpasswd" {
  template = <<EOF
${var.http_username}:${var.http_password_hash}
EOF

  vars = {
    http_username = "${var.http_username}"
    http_password_hash = "${var.http_password_hash}"
  }
}