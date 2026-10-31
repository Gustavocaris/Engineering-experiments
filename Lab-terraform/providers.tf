# Usa o Docker local (sem cloud)
provider "docker" {
  host = "unix:///var/run/docker.sock"
}
