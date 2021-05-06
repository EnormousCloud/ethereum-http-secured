
resource "docker_container" "ethereum" {
  image = docker_image.ethereum.latest
  name = local.host
  restart = "always"

  networks_advanced {
    name  = local.network_id
  }

  env = local.env
  command = concat(
    local.netparam,
    var.metrics ? [ "--pprof" , "--metrics" ] : [],
    [
      "--http", 
      "--http.addr", 
      "0.0.0.0", 
      "--http.api", 
      var.rpcapis,
      "--http.vhosts", "${local.host},${local.proxyhost},localhost",
      "--syncmode=${local.syncmode}"
    ])
  
  dynamic labels {
      for_each = local.labels
      content {
          label = labels.value.label
          value = labels.value.value
      }
  }

  labels {
    label = "role"
    value = "ethereum"
  }

  # port 30303 is the only port that should be open for P2P TCP connection
  # while RPC port 8545 is accessible to the internal network
  ports {
    internal = 30303
    external = 30303
    protocol = "udp" 
  }
  ports {
    internal = 30303
    external = 30303
  }

  # persistent storage
  volumes {
    container_path = "/root"
    read_only = false
    volume_name = docker_volume.storage.name
  }
}
