class BitoPro < ExchangeRate
  def self.get_rates(support_currencies = nil)
    support_currencies = get_support_currencies unless support_currencies
    ans = {}

    begin
      info = RestClient.get "https://api.bitopro.com/v3/tickers"
      # {"pair":"ltc_usdt","lastPrice":"41.77000000","isBuyer":true,"priceChange24hr":"0.65","volume24hr":"38.16094966","high24hr":"42.04000000","low24hr":"41.77000000"},
      info = JSON.parse(info)
      
      support_currencies.each do |quote, bases|
        bases.each do |base|
          pair = info["data"].select{|i| i["pair"] == "#{base.downcase}_#{quote.downcase}"}
          ans["#{base}/#{quote}"] = pair.first["lastPrice"]
        end
      end
  
    rescue Exception => e
      puts "error : get_bitoex_rate #{e}"
    end

    return ans
  end

  def self.get_support_currencies
    {"TWD" => ["USDT", "BTC", "ETH", "LTC"], "USDT" => ["BTC", "ETH"]}
  end
end