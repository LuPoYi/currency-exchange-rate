require 'nokogiri'
require 'open-uri'
require 'bigdecimal'

require_relative 'lib/exchange_rate.rb'
require_relative 'lib/taiwan_bank.rb'
require_relative 'lib/esun_bank.rb'

p TaiwanBank.get_rates
p EsunBank.get_rates

# {"USD/TWD"=>"29.5700", "GBP/TWD"=>"36.8500", "AUD/TWD"=>"20.5150", "JPY/TWD"=>"0.2752", "EUR/TWD"=>"33.2200"}
# {"USD/TWD"=>"29.4600", "JPY/TWD"=>"0.2740", "EUR/TWD"=>"33.1200", "AUD/TWD"=>"20.4400", "GBP/TWD"=>"36.7400"}