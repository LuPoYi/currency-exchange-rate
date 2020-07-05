require 'rest-client'
require 'json'
require 'nokogiri'
require 'open-uri'
require 'bigdecimal'

require_relative 'lib/exchange_rate.rb'
require_relative 'lib/taiwan_bank.rb'
require_relative 'lib/esun_bank.rb'
require_relative 'lib/bitoex.rb'
require_relative 'lib/bitopro.rb'

p TaiwanBank.get_rates
p EsunBank.get_rates
p BitoEX.get_rates
p BitoPro.get_rates

# TaiwanBank: {"USD/TWD"=>"29.5700", "GBP/TWD"=>"36.8500", "AUD/TWD"=>"20.5150", "JPY/TWD"=>"0.2752", "EUR/TWD"=>"33.2200"}
# EsunBank: {"USD/TWD"=>"29.4600", "JPY/TWD"=>"0.2740", "EUR/TWD"=>"33.1200", "AUD/TWD"=>"20.4400", "GBP/TWD"=>"36.7400"}
# BitoEX: {"BTC/TWD"=>"267572.50", "ETH/TWD"=>"6692.50", "USDT/TWD"=>"29.56"}
# BitoPro: {"USDT/TWD"=>"29.48000000", "BTC/TWD"=>"267469.00000000", "ETH/TWD"=>"6700.00000000", "LTC/TWD"=>"1226.00000000", "BTC/USDT"=>"9072.50000000", "ETH/USDT"=>"227.14000000"}