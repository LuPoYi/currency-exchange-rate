
class Binance < ExchangeRate
  def self.get_rates(support_currencies = nil)
    support_currencies = get_support_currencies unless support_currencies
    ans = {}

    begin
      info = RestClient.get "https://api.binance.com/api/v3/ticker/price"
      info = JSON.parse(info)
      
      support_currencies.each do |quote, bases|
        bases.each do |base|
          pair = info.select{|i| i["symbol"] == "#{base.upcase}#{quote.upcase}"}
          ans["#{base}/#{quote}"] = pair.first["price"].to_s
        end
      end
  
    rescue Exception => e
      puts "error : get_bitoex_rate #{e}"
    end

    return ans
  end

  def self.get_support_currencies
    return {"USDT" => ["BTC", "ETH", "ADA"]}
  end
end
