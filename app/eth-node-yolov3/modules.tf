locals {
    network_name = "yolov3"
}

module "network" {
    source = "./../../modules/network"
    project = local.network_name
}

module "ethereum" {
    source = "./../../modules/ethereum"
    network_name = local.network_name
    network_params = module.network.params
}