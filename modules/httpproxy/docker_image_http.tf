resource "docker_image" "http" {
  name = "nginx:stable-alpine"
  keep_locally = true
}