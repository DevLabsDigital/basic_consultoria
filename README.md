# README

Este projeto é uma versão mínima de um projeto em que o sistema de Consultoria pode rodar

Como este projeto tem que ser utilizado:

É necessário apontar no Gemfile onde fica no computador a GEM consultoria
```
gem 'consultoria', path: '$CONSULTORIA_GEM_PATH'
```

Na Gem consultoria é necessário rodar o seguinte comando
```
./bin/webpacker-dev-server
```

Esse projeto necessita:
* nodejs 11.10.1
* ruby 2.6.5
* postgresql >= 12


Como rodar esse projeto:
 primeiro: `substitua o database.example.yml por um database.yml`
 
 pode rodar normalmente como qualquer projeto rails ex.: `rails s -b 0.0.0.0`

