# 📊 Monitoramento de Moedas

Projeto em Ruby on Rails que permite visualizar a variação de moedas em tempo real por meio de gráficos interativos. Utiliza dados da API da [AwesomeAPI](https://docs.awesomeapi.com.br/api-de-moedas).

## 🔧 Tecnologias utilizadas

- Ruby on Rails 7.1.5.1
- Chartkick + Chart.js
- HTML/CSS (puro)
- API AwesomeAPI
- Sprockets

## ✨ Funcionalidades

- Visualização de gráfico para uma moeda específica ( USD, EUR, BTC )
- Comparação entre duas moedas com visualização gráfica
- Filtro por período: 7, 15 ou 30 dias

## 📦 Instalação

```bash
git clone https://github.com/matheusianidev/monitoramento_moedas.git
cd monitoramento_moedas
bundle install
bin/rails db:setup
bin/dev
