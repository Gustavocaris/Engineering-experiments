## Repositorio de Laboratório

<hr>

## Jovem, aqui Tu vai encontrar de tudo, É  publico, mas é um ambiente demo, testes, pra fazer umas brincadeiras mesmo ; )

<hr>

### desenvolvimento
### Infraestrutura
### cloud
### API

### Lab de CI (GitHub Actions)

App Node/Express em `app/` com testes usando o `node:test` nativo.

Rodar local:

```bash
cd app
npm ci
npm test
docker build -t lab-app .
docker run -d -p 5000:5000 lab-app
curl localhost:5000/health   # {"status":"ok"}
```

Pipeline em `.github/workflows/ci.yaml` (roda em push/PR na `developer` que mexa em `app/`, ou manual):

1. **test**: `npm ci` + `npm test` em paralelo nas versões 20 e 22 do Node (matrix).
2. **docker**: só roda se `test` passar (`needs`), faz o build da imagem, sobe o container e testa `/health`.
