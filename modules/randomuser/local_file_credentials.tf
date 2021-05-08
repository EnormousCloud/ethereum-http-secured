resource "local_file" "credentials" {
   content = <<EOF
export HTTP_USERNAME=${local.username}
export HTTP_PASSWORD=${local.password}
EOF
   filename = "./credentials.txt"
   file_permission = "0666"
}

