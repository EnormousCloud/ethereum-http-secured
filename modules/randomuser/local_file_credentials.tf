resource "local_file" "credentials" {
   content = <<EOF
Username: ${local.username}
Password: ${local.password}
EOF
   filename = "./credentials.txt"
   file_permission = "0666"
}


