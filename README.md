# VivaChallenge (accepted by @brenoholiveira) #
[![Build Status](https://travis-ci.org/brenooliveira/viva-challenge.svg?branch=master)](https://travis-ci.org/brenooliveira/viva-challenge)
[![Code Climate](https://codeclimate.com/github/brenooliveira/viva-challenge/badges/gpa.svg)](https://codeclimate.com/github/brenooliveira/viva-challenge)
[![Test Coverage](https://codeclimate.com/github/brenooliveira/viva-challenge/badges/coverage.svg)](https://codeclimate.com/github/brenooliveira/viva-challenge/coverage)

Dasafio [Viva Real Spotippos](https://github.com/VivaReal/code-challenge)

## Deploy on Heroku
[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy?template=https://github.com/brenooliveira/viva-challenge)

## Requisitos
 - docker
 - docker-compose

## Executando
Executando a aplicação:
```shell
docker-compose up --build
```

Executando os Testes:
```shell
docker-compose run viva-api bundle exec rspec
```

## Executando cUrl

#### Criando uma nova propriedade
```shell
curl -k -v -X POST http://localhost:5000/v1/properties -d '{
  "x": 222,
  "y": 444,
  "title": "Imóvel código 1, com 5 quartos e 4 banheiros",
  "price": 1250000,
  "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
  "beds": 4,
  "baths": 3,
  "squareMeters": 210
}' -H "Content-Type: application/json"
```
#### Consultando
```shell
curl -k -v -XGET http://localhost:5000/v1/properties/1
```

#### Buscando
```shell
curl -k -v -XGET http://localhost:5000/v1/properties?ax=200&ay=400&bx=250&by=450
```
