output "app_url" {
  value = "http://localhost:${var.app_port}"
}

output "web_url" {
  value = "http://localhost:${var.web_port}"
}

output "network" {
  value = docker_network.lab.name
}
