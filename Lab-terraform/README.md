# Lab-terraform

Mini projeto para brincar com Terraform **sem cloud**, usando o provider
[`kreuzwerker/docker`](https://registry.terraform.io/providers/kreuzwerker/docker/latest/docs)
contra o Docker local.

## O que é criado
- Rede Docker `lab-net`
- Imagem `lab-app` (build de `./app`) + container `lab-app` em `localhost:5000`
- Container `lab-web` (nginx) servindo `./web` em `localhost:8080`

## Como usar
```bash
terraform init
terraform plan
terraform apply
terraform output

curl localhost:5000/health
curl localhost:8080

terraform destroy
```

Trocar portas: `terraform apply -var="app_port=5001" -var="web_port=8081"`
