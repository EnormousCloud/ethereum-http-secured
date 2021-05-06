resource "docker_container" "http" {
  image = docker_image.http.latest
  name = local.host
  restart = "always"

  networks_advanced {
    name  = local.network_id
  }

  env = local.env

  dynamic labels {
      for_each = local.labels
      content {
          label = labels.value.label
          value = labels.value.value
      }
  }

  upload {
    content = "${data.template_file.nginx_conf_default.rendered}"
    file    = "/etc/nginx/conf.d/default.conf"
  }

  ports {
    internal = 80
    external = 80
  }
}
