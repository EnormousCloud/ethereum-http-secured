resource "docker_volume" "storage" {
  name = "${local.project}-ethereum-storage-${local.postfix}"
}
