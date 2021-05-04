resource "docker_network" internal {
  name = "${var.project}-internal-${local.postfix}"
}
