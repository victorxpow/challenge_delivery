# Desafio - Parse JSON
Projeto realizado com base no desafio proposto, foi feito usando Ruby on Rails e banco de dados postgres e Docker.

## Como iniciar o projeto
Para executar esse projeto você deve ter um computador, preferencialmente com Linux, com a linguagem de programação Ruby na versão 2.7.2, e também:

- postgres
- Nodejs
- Yarn

Dentro do diretório do projeto, você deve instalar as dependências definidas no arquivo Gemfile com o comando `ruby bin/setup`

Com todas dependências instaladas, execute rails server e use o comando `rspec` para utilizar os testes elaborados para o desafio.

Ou pode usar o Docker, bastando ter o Docker e docker-compose instalado

## Rodando o projeto com docker

Você só precisa usar o comando `docker-compose up -d` para levantar o container em background, você deve instalar as dependências definidas no arquivo Gemfile com o comando `docker-compose exec rails bin/setup` e acesse localhost:3000/order em seu navegador ou use o comando `docker-compose run --service-ports rails bash` e tenha acesso ao bash do container e rode o comando `ruby bin/setup` para utilizar os testes elaborados para o desafio.

## Enviandor um pedido

Para criar um novo pedido é necessario:

* `verb` - `POST`
* `endpoint` - `/api/v1/order`
* `body` - [spec/fixtures/payload.json](spec/fixtures/payload.json)

```bash
curl -H 'Content-Type: application/json' \
     -d @spec/fixtures/payload.json \
     'http://localhost:3000/api/v1/orders'
```

## Gem's Utilizadas

- Rubocop - Me auxilia a manter a boas praticas dentro da linguaguem, tento utilizar de forma a me policar para eventualmente deixar de usa-lo.
- Shoulda Matchers - facilitar as validações
- SimpleCov - garantir e acompanhar a cobertura de testes

### Etapas futuras

- Aumentar a cobertura de testes e o numero de cases.
- Incluir uma forma de authenticação e ou encriptação de dados sensiveis.