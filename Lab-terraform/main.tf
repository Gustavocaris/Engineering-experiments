# Rede compartilhada entre os containers
resource "docker_network" "lab" {
  name   = "${var.project_name}-net"
  driver = "bridge"
}

# ---------- App Node/Express ----------
resource "docker_image" "app" {
  name = "${var.project_name}-app:latest"

  build {
    context = "${path.module}/app"
  }

  # Rebuild automatico quando qualquer arquivo do app mudar
  triggers = {
    dir_sha1 = sha1(join("", [for f in fileset("${path.module}/app", "**") : filesha1("${path.module}/app/${f}")]))
  }
}

resource "docker_container" "app" {
  name  = "${var.project_name}-app"
  image = docker_image.app.image_id

  ports {
    internal = 5000
    external = var.app_port
  }

  networks_advanced {
    name = docker_network.lab.id
  }

  healthcheck {
    test     = ["CMD", "wget", "-qO-", "http://localhost:5000/health"]
    interval = "10s"
    timeout  = "3s"
    retries  = 3
  }
}

# ---------- Site estatico (nginx) ----------
resource "docker_image" "nginx" {
  name = "nginx:alpine"
}

resource "docker_container" "web" {
  name  = "${var.project_name}-web"
  image = docker_image.nginx.image_id

  ports {
    internal = 80
    external = var.web_port
  }

  volumes {
    host_path      = abspath("${path.module}/web")
    container_path = "/usr/share/nginx/html"
    read_only      = true
  }

  networks_advanced {
    name = docker_network.lab.id
  }
}
