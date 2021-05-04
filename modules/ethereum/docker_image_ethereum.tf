resource "docker_image" "ethereum" {
  name = "ethereum/client-go:v1.10.2"
  keep_locally = true
}