locals {
    network_id = var.network_params.network_id
    project = var.network_params.project
    postfix = var.network_params.postfix
    network_name = var.network_name

    host = "http-${local.network_name}-${var.network_params.postfix}"
    env = []
}

locals {
    labels = concat(
        var.network_params.labels,
        [{ 
            label = "role"
            value = "httpproxy"
        }, {
            label = "host"
            value = local.host
        }]
    )
}