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
require_relative 'lib/ftx.rb'
require_relative 'lib/bybit.rb'
require_relative 'lib/kucoin.rb'
require_relative 'lib/binance.rb'

p TaiwanBank.get_rates
p EsunBank.get_rates
p BitoEX.get_rates
p BitoPro.get_rates
p Ftx.get_rates
p Bybit.get_rates
p Kucoin.get_rates
p Binance.get_rates

# TaiwanBank: {"USD/TWD"=>"29.5700", "GBP/TWD"=>"36.8500", "AUD/TWD"=>"20.5150", "JPY/TWD"=>"0.2752", "EUR/TWD"=>"33.2200"}
# EsunBank: {"USD/TWD"=>"29.4600", "JPY/TWD"=>"0.2740", "EUR/TWD"=>"33.1200", "AUD/TWD"=>"20.4400", "GBP/TWD"=>"36.7400"}
# BitoEX: {"BTC/TWD"=>"267572.50", "ETH/TWD"=>"6692.50", "USDT/TWD"=>"29.56"}
# BitoPro: {"USDT/TWD"=>"29.48000000", "BTC/TWD"=>"267469.00000000", "ETH/TWD"=>"6700.00000000", "LTC/TWD"=>"1226.00000000", "BTC/USDT"=>"9072.50000000", "ETH/USDT"=>"227.14000000"}
# Ftx: {"BTC/PERP"=>9024.5}
# Bybit: {"BTC/USDT"=>"9231.00", "BTC/USD"=>"9235.00"}
# Kucoin: {"NRG/BTC"=>"0.00022721", "BTC/USDT"=>"9232.2"}
# Binace: {"BTC/USDT"=>"9262.00000000", "ETH/USDT"=>"237.16000000", "ADA/USDT"=>"0.10657000"}