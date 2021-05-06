locals {
    network_name = "mainnet"
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

module "httpproxy" {
    source = "./../../modules/httpproxy"
    network_name = local.network_name
    backend_host = module.ethereum.host.hostname
    network_params = module.network.params
}