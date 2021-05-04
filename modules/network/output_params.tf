output "params" {
  value = ({
    network_id = docker_network.internal.id,
    postfix = local.postfix,
    project = var.project,
    workspace = var.workspace,
    labels = [{
      label = "project"
      value = var.project
    }],
  })
}
