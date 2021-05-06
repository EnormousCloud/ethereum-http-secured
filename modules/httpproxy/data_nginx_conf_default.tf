data "template_file" "nginx_conf_default" {
  template = <<-EOT
    upstream ethereum_backend {
        least_conn;
        server $${node_ip}:8545 max_fails=0 fail_timeout=15s;
    }
    server {
        listen       80;
        listen  [::]:80;
        server_name _;
        location / {
            # auth_basic "Ethereum $${network_name}";
            # auth_basic_user_file /etc/nginx/.htpasswd;

            proxy_pass http://ethereum_backend;
            proxy_set_header Host            $host;
            proxy_set_header X-Forwarded-For $remote_addr;
        }
    }
EOT

  vars = {
    network_name = "${var.network_name}"
    node_ip = "${var.backend_host}"
  }
}