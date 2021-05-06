locals {
    network_id = var.network_params.network_id
    project = var.network_params.project
    postfix = var.network_params.postfix
    syncmode = var.light ? "light": "snap"
    network_name = var.network_name

    host = "eth-${local.network_name}-${local.syncmode}-${var.network_params.postfix}"
    proxyhost = "http-${local.network_name}-${var.network_params.postfix}"
    env = []
}

locals {
    netparam = concat(
        local.network_name == "goerli" ? ["--goerli"] : [],
        local.network_name == "rinkeby" ? ["--rinkeby"] : [],
        local.network_name == "yolov3" ? ["--yolov3"] : [],
        local.network_name == "ropsten" ? ["--ropsten"] : []
    )

    labels = concat(
        var.network_params.labels,
        [{ 
            label = "role"
            value = "ethereum"
        }, {
            label = "host"
            value = local.host
        }, {
            label = "syncmode"
            value = local.syncmode
        }]
    )
}