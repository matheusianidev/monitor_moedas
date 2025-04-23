require 'net/http'
require 'json'

class HomeController < ApplicationController
  CURRENCIES = [
    { code: 'USD-BRL' },
    { code: 'EUR-BRL' },
    { code: 'BTC-BRL' }
  ]

  def index
    # Gráfico de moeda única
    @chart_data = []

    if params[:currency].present?
      currency = params[:currency]
      period = (params[:period] || 30).to_i

      url = URI("https://economia.awesomeapi.com.br/json/daily/#{currency}/#{period}")
      response = Net::HTTP.get(url)
      data = JSON.parse(response)

      hash = {}
      data.each do |entry|
        date = Time.at(entry['timestamp'].to_i)
        rate = entry['high']
        hash[date] = rate
      end

      @chart_data << { name: currency, data: hash }
    end

    # Gráfico comparativo
    @compare_data = []

    if params[:currency1].present? && params[:currency2].present?
      period = (params[:compare_period] || 30).to_i

      [params[:currency1], params[:currency2]].each do |code|
        url = URI("https://economia.awesomeapi.com.br/json/daily/#{code}/#{period}")
        response = Net::HTTP.get(url)
        data = JSON.parse(response)

        hash = {}
        data.each do |entry|
          date = Time.at(entry['timestamp'].to_i)
          rate = entry['high']
          hash[date] = rate
        end

        @compare_data << { name: code, data: hash }
      end
    end
  end
end
