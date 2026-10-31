variable "project_name" {
  description = "Prefixo usado nos nomes dos recursos"
  type        = string
  default     = "lab"
}

variable "app_port" {
  description = "Porta no host para o app Node"
  type        = number
  default     = 5000
}

variable "web_port" {
  description = "Porta no host para o site estatico (nginx)"
  type        = number
  default     = 8080
}
